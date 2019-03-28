from django.shortcuts import render, redirect
from django.views import View
from django.views.generic import (
    TemplateView,
)
from exercise.models import (
    Tag,
    Exercise,
    ExerciseUser,
    ExerciseTest,
    ExerciseTestUser,
    ExerciseUserComment
)
from users.models import (
    Badge,
    UserMessage
)
from django.urls import reverse
from django.contrib.auth.mixins import LoginRequiredMixin
from django.db.models import Q
import ast
import json
import docker


def achievement_check(request):
    user = request.user
    user_badges = user.badges.all()
    achievements = []

    # First Achieve
    badge0 = Badge.objects.filter(title="First Achieve")
    if badge0 and badge0[0] not in user_badges:
        achievements.append(badge0[0])

    # Socialize
    badge1 = Badge.objects.filter(title="Socialize")
    if (badge1 and badge1[0] not in user_badges and
            len(UserMessage.objects.filter(sender=user)) >= 1):
        achievements.append(badge1[0])

    # Socialize more
    badge2 = Badge.objects.filter(title="Socialize More")
    if (badge2 and badge2[0] not in user_badges and
            len(UserMessage.objects.filter(sender=user)) >= 3):
        achievements.append(badge2[0])

    # Gettin' Started
    badge3 = Badge.objects.filter(title="Gettin' Started")
    if (badge3 and badge3[0] not in user_badges and
            len(ExerciseUser.objects.filter(user=user, submitted=True)) >= 1):
        achievements.append(badge3[0])
    # Good Streak
    badge4 = Badge.objects.filter(title="Good Streak")
    if (badge4 and badge4[0] not in user_badges and
            len(ExerciseUser.objects.filter(user=user, submitted=True)) >= 3):
        achievements.append(badge4[0])

    return achievements


class LandingPageView(TemplateView):
    template_name = "exercise/index.html"

    def get(self, request):
        if request.user.is_authenticated:
            return redirect(reverse("home"))
        return render(request, self.template_name)


class HomeView(LoginRequiredMixin, View):

    def __init__(self):
        self.exercise_random = Exercise.objects.order_by('?').first()
        self.exercises = Exercise.objects.all()
        self.tags = Tag.objects.all()
        self.levels = Exercise.LEVELS

    def get(self, request, *args, **kwargs):
        level_before = request.user.level

        # handle additional arguments
        if request.GET.get("tag"):
            self.exercises = self.exercises.filter(
                tags__slug=request.GET["tag"])
            kwargs['filter_type'] = request.GET['tag']

        # handle achievements
        achievements = achievement_check(request)
        if achievements:
            kwargs["achievements"] = []
            for achievement in achievements:
                exp_points = achievement.reward_points

                request.user.experience_pts += exp_points
                request.user.badges.add(achievement)

                kwargs["achievements"].append(achievement)
            request.user.save()

        # handle new level
        level_after = request.user.level

        if level_before != level_after:
            kwargs["new_level"] = True

        return render(request, "exercise/home.html", {
            'exercises': self.exercises,
            'exercise_random': self.exercise_random,
            'tags': self.tags,
            'levels': self.levels,
            **kwargs
        })

    def post(self, request, *args, **kwargs):

        if 'filter' in request.POST:
            tag = request.POST.get("tag")
            level = request.POST.get("level")

            if tag == 'all' and level == 'all':
                return self.get(request)
            elif tag == 'all':
                self.exercises = self.exercises.filter(level=level)
                message = self.levels[int(level) - 1][1]
            elif level == 'all':
                self.exercises = self.exercises.filter(tags__id=tag)
                message = self.tags.get(pk=tag).name
            else:
                self.exercises = self.exercises.filter(
                    tags__id=tag, level=int(level))
                message = "{} and {}".format(
                    self.levels[int(level) - 1][1],
                    self.tags.get(pk=tag).name
                )
            kwargs['filter_type'] = message

        if 'search' in request.POST:
            search_phrase = request.POST.get("phrase")

            self.exercises = self.exercises.filter(
                Q(title__icontains=search_phrase) |
                Q(short_description__icontains=search_phrase) |
                Q(description__icontains=search_phrase)
            )
            kwargs['filter_type'] = search_phrase

        return render(request, "exercise/home.html", {
            'exercises': self.exercises,
            'exercise_random': self.exercise_random,
            'tags': self.tags,
            'levels': self.levels,
            **kwargs
        })

    def handle_no_permission(self):
        return redirect(reverse("index"))


def setup_container(user, exercise, container_name):
    """Function creates new container dedicated to logged user
    It's creating new ExerciseTestUser objects to store tests
    history in database """
    client = docker.from_env()
    container = client.containers.run(
        image=exercise.image_name,
        detach=True,
        tty=True,
        name=container_name
    )
    start_code = container.exec_run("cat exercise.py", stdout=True)

    # tests:
    tests = ast.literal_eval(container.exec_run("python3 test_list.py", stdout=True)[
        1].decode("utf-8"))
    ExerciseUser.objects.create(
        exercise=exercise,
        user=user,
        code=start_code
    )

    for counter in range(len(tests)):
        exercise_test = ExerciseTest.objects.get(
            exercise=exercise, test_number=counter + 1)
        ExerciseTestUser.objects.create(
            user=user,
            exercise_test=exercise_test,
            output=None,
        )
    return container


class ExerciseView(LoginRequiredMixin, View):
    """View for Exercise dedicated for user"""

    # tu będzie logika, która będzie sprawdzała czy obecnie zalogowany użytkownik ma w bazie
    # ExerciseUser rekord jeśli tak - to wystartuj kontener o nazwie <użytkownik>_<zadanie_id>
    # jeśli nie to stwórz nowy kontener, zwróć to co jest w polu code w tabeli ExerciseUser,
    # dodać w template logikę że jeśli użytkownik nie dostał jeszcze response od API czy
    # jego testy przeszły (bo jeszcze nie uruchamiał) - to nie pozwól kliknąc na przycisk submit
    # zwrócić kod który pobierze z kontenera (docker container exec -it cat exercise.py)
    def get(self, request, slug):
        """If User has been into this exercise, container will exists in memory
        so container on specific name will be started. Otherwise new container will
        be started, also there will be new object in ExerciseUser model.

        To allow comunication with containers - we use docker library.
        We fetch code using `cat <filename>`. This code is passed to context.
        """
        exercise = Exercise.objects.get(slug=slug)  # dodać potem try/except
        user = request.user

        # docker
        container_name = "{}_{}".format(user.username, exercise.id)
        client = docker.from_env()

        # pobieranie kontenera, bądź uruchamianie
        try:
            container = client.containers.get(container_name)
            container.start()

            tests = ast.literal_eval(container.exec_run("python3 test_list.py", stdout=True)[
                1].decode("utf-8"))
        except docker.errors.NotFound:
            container = setup_container(user, exercise, container_name)
            # container = client.containers.run(
            #     image=exercise.image_name,
            #     detach=True,
            #     tty=True,
            #     name=container_name
            # )
            # start_code = container.exec_run("cat exercise.py", stdout=True)

            # # tests:
            # tests = ast.literal_eval(container.exec_run("python3 test_list.py", stdout=True)[
            #     1].decode("utf-8"))
            # ExerciseUser.objects.create(
            #     exercise=exercise,
            #     user=user,
            #     code=start_code
            # )

            # for counter, test in enumerate(tests, 1):
            #     exercise_test = ExerciseTest.objects.get(
            #         exercise=exercise, test_number=counter)
            #     ExerciseTestUser.objects.create(
            #         user=user,
            #         exercise_test=exercise_test,
            #         output=None,
            #     )

        code = container.exec_run("cat exercise.py", stdout=True)

        exercise_user = ExerciseUser.objects.get(user=user, exercise=exercise)
        comments = ExerciseUserComment.objects.filter(
            exercise=exercise).order_by("-date")

        exercise_tests = ExerciseTest.objects.filter(
            exercise=exercise).order_by("-test_number")
        test_users = ExerciseTestUser.objects.filter(
            user=user, exercise_test__in=exercise_tests)[::-1]

        return render(request, "exercise/exercise.html", {
            'code': code[1].decode("ascii"),
            "container_name": container_name,
            "exercise": exercise,
            "exercise_user": exercise_user,
            "comments": comments,
            # "tests": tests,
            "test_users": test_users
        })

    # redirect user to home page
    def handle_no_permission(self):
        return redirect(reverse("index"))
