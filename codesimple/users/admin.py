from django.contrib import admin
from users.models import Badge, ProgrammingLanguage


@admin.register(Badge)
class BadgeAdmin(admin.ModelAdmin):
    pass


@admin.register(ProgrammingLanguage)
class ProgrammingLanguageAdmin(admin.ModelAdmin):
    pass
