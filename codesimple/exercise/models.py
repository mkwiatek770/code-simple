from django.db import models
from django.utils.text import slugify
from ckeditor.fields import RichTextField
# Create your models here.


class Tag(models.Model):
    name = models.CharField(max_length=50)
    slug = models.SlugField()

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super().save(*args, **kwargs)

    def __str__(self):
        return self.name


class Exercise(models.Model):

    LEVELS = (
        (1, "NEWBIE"),
        (2, "BEGINNER"),
        (3, "INTERMEDIATE"),
        (4, "HARD"),
        (5, "MASTER")
    )

    title = models.CharField(max_length=50, unique=True)
    slug = models.SlugField(unique=True)
    image_name = models.CharField(max_length=100)
    short_description = models.TextField(max_length=255)
    description = RichTextField()
    level = models.IntegerField(choices=LEVELS)
    experience_points = models.PositiveIntegerField()
    likes = models.SmallIntegerField(default=0)
    dislikes = models.SmallIntegerField(default=0)
    tags = models.ManyToManyField(Tag)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        super().save(*args, **kwargs)

    def __str__(self):
        return self.title


class ExerciseTest(models.Model):
    test_number = models.IntegerField()
    exercise = models.ForeignKey(Exercise, on_delete=models.CASCADE)
    user_input = models.CharField(max_length=255)
    expected_output = models.CharField(max_length=255)

    def __str__(self):
        return f"{self.exercise.title} {self.user_input} --> {self.expected_output}"


class ExerciseTestUser(models.Model):

    user = models.ForeignKey('users.ProfileUser', on_delete=models.CASCADE)
    exercise_test = models.ForeignKey(ExerciseTest, on_delete=models.CASCADE)
    output = models.CharField(max_length=255, null=True)
    passed = models.NullBooleanField()  # later in views changed solved to passed


class ExerciseUserComment(models.Model):
    user = models.ForeignKey("users.ProfileUser", on_delete=models.CASCADE)
    exercise = models.ForeignKey(Exercise, on_delete=models.CASCADE)
    message = models.TextField(max_length=4096)
    date = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.user} - {self.exercise.title}"
