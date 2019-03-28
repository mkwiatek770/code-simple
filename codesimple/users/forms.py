from django import forms
from users.models import ProfileUser


class ProfileUserForm(forms.ModelForm):
    class Meta:
        model = ProfileUser
        fields = ("username", "password", "email",
                  "favourite_language", "avatar")
