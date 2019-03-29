from django.urls import path
from api import views

urlpatterns = [
    path(
        "exercises/<int:exercise_id>/add-comment/",
        views.add_comment,
        name="add_comment"
    ),
    path(
        "exercises/<int:exercise_id>/<rate_type>/",
        views.rate_exercise,
        name="rate_exercise"
    ),
    path(
        "exercises/<int:exercise_id>/<int:user_id>",
        views.CodeAPIView.as_view(),
        name="exercises_user"
    ),
    path(
        "exercises/submit/<int:exercise_id>/<int:user_id>",
        views.SubmitAPIView.as_view(),
        name="submit"
    ),
]
