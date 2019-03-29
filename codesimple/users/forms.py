from django import forms
from users.models import ProfileUser
from ckeditor.widgets import CKEditorWidget


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


class UserMessageForm(forms.Form):

    subject = forms.CharField(max_length=255)
    message = forms.CharField(widget=CKEditorWidget())
