from django.contrib import admin
from exercise.models import Exercise, ExerciseTest, Tag


@admin.register(Tag)
class TagAdmin(admin.ModelAdmin):
    pass


@admin.register(Exercise)
class ExerciseAdmin(admin.ModelAdmin):
    pass


@admin.register(ExerciseTest)
class ExerciseTestAdmin(admin.ModelAdmin):
    pass
