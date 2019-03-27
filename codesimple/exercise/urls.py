from django.urls import path
from exercise import views

urlpatterns = [
    path("", views.LandingPageView.as_view(), name="index"),
    path("home/", views.HomeView.as_view(), name="home"),
]
