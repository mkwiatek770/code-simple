from django.urls import path
from users import views


urlpatterns = [
    path("login/", views.signin, name="login"),
    path("logout/", views.logoutuser, name="logout"),
    path("signup/", views.SignUpView.as_view(), name="signup"),
]
