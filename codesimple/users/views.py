from django.views import View
from django.shortcuts import render, redirect
from django.http import HttpResponse, Http404
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.urls import reverse, reverse_lazy
from django.views.generic import (
    FormView,
    UpdateView,
    DetailView,
    ListView,
    TemplateView
)
from users.models import (
    ProfileUser,
    UserMessage,
)
from exercise.models import ExerciseUser
from users.forms import (
    ProfileUserForm,
    ProfileUserUpdateForm
)

# sending mail
from django.utils.encoding import force_bytes, force_text
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.template.loader import render_to_string
from .tokens import account_activation_token
from django.contrib.sites.shortcuts import get_current_site
# from django.core.mail import EmailMessage
from mail_templated import EmailMessage
from django.conf import settings
# messages
from django.contrib import messages
from django.contrib.messages.views import SuccessMessageMixin
from django.contrib.auth.mixins import LoginRequiredMixin


# Create your views here.


def signin(request):
    """view to login user, if user clicked REMEMBER ME
    button session will be set to 30 days, otherwise, session will
    be expired on closing browser"""

    username = request.POST.get("username")
    password = request.POST.get("password")
    remember_me = request.POST.get("remember")

    user = authenticate(username=username, password=password)
    if user:
        login(request, user)

        # handle remember me checkbox
        if remember_me:
            request.session.set_expiry(60 * 60 * 24 * 30)
        else:
            request.session.set_expiry(0)

        return redirect(reverse("home"))
    else:
        messages.add_message(request, messages.INFO,
                             "Invalid username or password")
        return redirect(reverse("index"))


@login_required
def logoutuser(request):
    """view to logout user, available only for users
    that are already logged in"""

    logout(request)
    return redirect(reverse("index"))


class SignUpView(FormView):
    """View for SignUpView, if user passed his
    credentials properly, an confirmation email will be send
    to his email to get access to his account."""

    def get(self, request, errors=None):
        form = ProfileUserForm()
        return render(request, "users/signup.html", {
            'form': form,
            'errors': errors
        })

    def post(self, request):
        form = ProfileUserForm(request.POST, request.FILES)

        if form.is_valid():

            user = form.save(commit=False)
            user.is_active = False
            user.set_password(form.cleaned_data['password'])
            user.save()

            current_site = get_current_site(request)

            mail_subject = "Activate your account."
            message = render_to_string("components/acc_activate_email.html", {
                'user': user,
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)).decode(),
                'token': account_activation_token.make_token(user),
            })
            to_email = form.cleaned_data['email']

            message = EmailMessage(
                'components/acc_activate.tpl',
                {
                    'user': user,
                    'domain': current_site.domain,
                    'uid': urlsafe_base64_encode(force_bytes(user.pk)).decode(),
                    'token': account_activation_token.make_token(user)
                },
                settings.EMAIL_HOST_USER,
                to=[to_email, ]
            )

            # email sending
            message.send()
            return render(request, "users/conf_email.html", {
                'user': user
            })
        else:
            return self.get(request, errors=form.errors)


def activate(request, uidb64, token):
    """Function to activate user account it's checking if
    user exists in database and checks if token is correct.
    If these two conditions are correct - status of user will be
    set to is_active, otherwise there will be displayed message
    that activation link is invalid"""
    try:
        uid = force_text(urlsafe_base64_decode(uidb64))
        user = ProfileUser.objects.get(pk=uid)
    except(TypeError, ValueError, OverflowError, ProfileUser.DoesNotExist):
        user = None
    if user is not None and account_activation_token.check_token(user, token):
        user.is_active = True
        user.save()
        login(request, user)

        messages.success(request, f"{user.username} welcome at CodeSimple!")
        return redirect(reverse('home'))
    else:
        return HttpResponse('Activation link is invalid!')


class ProfileUserUpdateView(LoginRequiredMixin, SuccessMessageMixin, UpdateView):

    model = ProfileUser
    form_class = ProfileUserUpdateForm
    template_name = "users/update.html"
    success_message = "Profile has been succesfully updated!"

    def get_success_url(self):
        return reverse_lazy("home")

    def handle_no_permission(self):
        return reverse_lazy("index")
