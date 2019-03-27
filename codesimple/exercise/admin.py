from django.contrib import admin
from exercise.models import (
    Exercise,
    ExerciseTest,
    Tag,
    ExerciseTestUser,
    ExerciseUserComment
)


@admin.register(Tag)
class TagAdmin(admin.ModelAdmin):
    pass


@admin.register(Exercise)
class ExerciseAdmin(admin.ModelAdmin):
    pass


@admin.register(ExerciseTest)
class ExerciseTestAdmin(admin.ModelAdmin):
    pass


@admin.register(ExerciseTestUser)
class ExerciseTestUserAdmin(admin.ModelAdmin):
    pass


@admin.register(ExerciseUserComment)
class ExerciseUserCommentAdmin(admin.ModelAdmin):
    pass
