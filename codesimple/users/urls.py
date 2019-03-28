from django.urls import path, re_path
from users import views


urlpatterns = [
    path("login/", views.signin, name="login"),
    path("logout/", views.logoutuser, name="logout"),
    path("signup/", views.SignUpView.as_view(), name="signup"),
    re_path(r'^activate/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/$',
            views.activate, name='activate'),
]
