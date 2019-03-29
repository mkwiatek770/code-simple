from exercise.models import (
    Exercise,
    ExerciseUser,
    ExerciseTest,
    ExerciseTestUser,
    ExerciseUserComment
)
from users.models import (
    ProfileUser,
)
from api.serializers import (
    CodeSerializer,
    ExerciseUserSerializer,
    ExerciseUserSubmitSerializer
)
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
import docker
import ast


@login_required
def rate_exercise(request, exercise_id, rate_type):
    exercise = Exercise.objects.get(id=exercise_id)
    exercise_user = ExerciseUser.objects.get(
        user=request.user, exercise=exercise)

    if rate_type == "like":

        if exercise_user.like is False:
            exercise.dislikes -= 1
            exercise.likes += 1
        elif exercise_user.like is None:
            exercise.likes += 1
        exercise_user.like = True

    elif rate_type == "dislike":

        if exercise_user.like:
            exercise.likes -= 1
            exercise.dislikes += 1
        elif exercise_user.like is None:
            exercise.dislikes += 1
        exercise_user.like = False

    exercise.save()
    exercise_user.save()

    return JsonResponse({"exercise": exercise.title, "rate_type": rate_type})


@login_required
def add_comment(request, exercise_id):

    message = request.POST.get("message")
    exercise = Exercise.objects.get(id=exercise_id)

    ExerciseUserComment.objects.create(
        user=request.user,
        exercise=exercise,
        message=message
    )
    return JsonResponse({"message": message})


class CodeAPIView(APIView):
    """View where in post is main logic of application"""

    def get(self, request, exercise_id, user_id, format=None):
        """Endpoint to communicate with frontend application
        using AJAX calls."""
        exercise_user = ExerciseUser.objects.get(
            user__id=user_id, exercise__id=exercise_id)

        tests = ExerciseTest.objects.filter(
            exercise__id=exercise_id).order_by("test_number")

        TESTS = []  # input, output, expected_output
        for test in tests:
            test_user = ExerciseTestUser.objects.get(
                exercise_test=test, user=request.user)
            TESTS.append([
                str(test_user.exercise_test.user_input),
                str(test_user.output),
                str(test_user.exercise_test.expected_output),
                "OK" if test_user.passed else "FAIL"
            ])

        if exercise_user.traceback:
            traceback = exercise_user.traceback
        else:
            traceback = None

        data = {
            "solved": exercise_user.solved,
            "tests": TESTS,
            "traceback": traceback
        }

        serializer = ExerciseUserSerializer(data=data)

        if serializer.is_valid():

            return JsonResponse(serializer.data)
        else:
            return JsonResponse(serializer.errors)

    def post(self, request, exercise_id, user_id, format=None):
        """Code is received and put into docker container.
        Tests are runned and result is returned.
        This block of code is executed when user clicks
        RUN TESTS button."""
        serializer = CodeSerializer(data=request.data)

        if serializer.is_valid():
            code = serializer.data['code']
            container_name = serializer.data['container_name']

            # docker
            client = docker.from_env()
            container = client.containers.get(container_name)

            # pass code to container
            container.exec_run(f'sh -c \'echo "{code}" > exercise.py\'')
            # run tests
            result = container.exec_run(
                "python3 tests.py", stdout=True)[1].decode("utf-8")
            result = ast.literal_eval(result)

            exercise_user = ExerciseUser.objects.get(
                exercise__id=exercise_id, user__id=user_id)
            exercise_user.code = code

            if not result["errors"]:

                traceback = None
                exercise_user.traceback = None
                tests = result["tests"]

                exercise_tests = ExerciseTest.objects.filter(
                    exercise__id=exercise_id).order_by("test_number")

                all_passed = True

                for counter, test in enumerate(tests):

                    exercise_test_user = ExerciseTestUser.objects.get(
                        exercise_test=exercise_tests[counter],
                        user=request.user)

                    exercise_test_user.output = test[1]

                    if test[3] == "FAIL":
                        exercise_user.solved = False
                        exercise_test_user.passed = False
                        all_passed = False
                    else:
                        exercise_test_user.passed = True
                    exercise_test_user.save()

                else:
                    exercise_user.solved = True

                if all_passed:
                    exercise_user.solved = True

                else:
                    exercise_user.solved = False
            else:
                # error occured instead of tests, traceback will be returned
                exercise_user.solved = False

                traceback = result["error_traceback"]
                exercise_user.traceback = traceback
                tests = None

            exercise_user.save()

            return JsonResponse({
                'solved': exercise_user.solved,
                'traceback': traceback,
                "tests": tests
            })
        else:
            return Response(serializer.errors,
                            status=status.HTTP_400_BAD_REQUEST)


class SubmitAPIView(APIView):
    """View for submit exercise.
    It's executed after clicking submit button.
    """

    def get(self, request, exercise_id, user_id, format=None, message=None, new_level=False):  # noqat
        data = {
            "message": message,
        }
        serializer = ExerciseUserSubmitSerializer(data=data)

        if serializer.is_valid():
            return JsonResponse(serializer.data)
        else:
            return JsonResponse(serializer.errors)

    def post(self, request, exercise_id, user_id, format=None):
        exercise_user = ExerciseUser.objects.get(
            exercise__id=exercise_id, user__id=user_id)

        if exercise_user.submitted:
            msg = f"Congratulations, you've solved exercise {exercise_user.exercise.title}"  # noqa
            return self.get(request, exercise_id, user_id, message=msg)
        else:
            exercise_user.submitted = True
            exercise_user.save()

            points_to_gain = exercise_user.exercise.experience_points
            user = ProfileUser.objects.get(pk=user_id)

            level_before = user.level
            user.experience_pts += points_to_gain
            level_after = user.level
            user.save()

            if level_before != level_after:
                new_level = True
            else:
                new_level = False

            msg = f"Congratulations, you've solved exercise {exercise_user.exercise.title} Points +{points_to_gain}"  # noqa
            return self.get(
                request,
                exercise_id,
                user_id, message=msg,
                new_level=new_level
            )
