from django.shortcuts import render, redirect
from django.views import View
from django.views.generic import (
    TemplateView
)
from django.urls import reverse, reverse_lazy


class LandingPageView(TemplateView):
    template_name = "exercise/index.html"

    def get(self, request):
        if request.user.is_authenticated:
            return redirect(reverse("home"))
        return render(request, self.template_engine)


class HomeView(View):
    def get(self, request):
        pass
