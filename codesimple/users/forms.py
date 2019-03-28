from django import forms
from users.models import ProfileUser


class ProfileUserForm(forms.ModelForm):
    class Meta:
        model = ProfileUser
        fields = ("username", "password", "email",
                  "favourite_language", "avatar")


class ProfileUserUpdateForm(forms.ModelForm):

    class Meta:
        model = ProfileUser
        fields = (
            "username",
            "first_name",
            "last_name",
            "favourite_language",
            "avatar"
        )
