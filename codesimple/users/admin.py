from django.contrib import admin
from users.models import (
    Badge,
    ProgrammingLanguage,
    ProfileUser,
    UserMessage,
)


@admin.register(Badge)
class BadgeAdmin(admin.ModelAdmin):
    pass


@admin.register(ProgrammingLanguage)
class ProgrammingLanguageAdmin(admin.ModelAdmin):
    pass


@admin.register(ProfileUser)
class ProfileUserAdmin(admin.ModelAdmin):
    pass


@admin.register(UserMessage)
class UserMessageAdmin(admin.ModelAdmin):
    pass
