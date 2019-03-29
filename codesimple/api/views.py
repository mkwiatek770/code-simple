from exercise.models import (
    Exercise,
    ExerciseUser,
    ExerciseUserComment
)
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required


@login_required
def rate_exercise(request, exercise_id, rate_type):
    exercise = Exercise.objects.get(id=exercise_id)
    exercise_user = ExerciseUser.objects.get(
        user=request.user, exercise=exercise)

    if rate_type == "like":

        if exercise_user.like == False:
            exercise.dislikes -= 1
            exercise.likes += 1
        elif exercise_user.like == None:
            exercise.likes += 1
        exercise_user.like = True

    elif rate_type == "dislike":

        if exercise_user.like == True:
            exercise.likes -= 1
            exercise.dislikes += 1
        elif exercise_user.like == None:
            exercise.dislikes += 1
        exercise_user.like = False

    exercise.save()
    exercise_user.save()

    return JsonResponse({"exercise": exercise.title, "rate_type": rate_type})


@login_required
def add_comment(request, exercise_id):
    # import pdb
    # pdb.set_trace()

    message = request.POST.get("message")
    exercise = Exercise.objects.get(id=exercise_id)

    ExerciseUserComment.objects.create(
        user=request.user,
        exercise=exercise,
        message=message
    )
    return JsonResponse({"message": message})
