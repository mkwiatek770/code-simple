from django.db import models
from django.utils.text import slugify
from ckeditor.fields import RichTextField
from django.utils import timezone
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
        title = self.exercise.title
        user_input = self.user_input
        expected_output = self.expected_output
        return f"{title} {user_input} --> {expected_output}"


class ExerciseUser(models.Model):
    INDENTS = (
        ("one", 1),
        ("two", 2),
        ("four", 4)
    )

    EDITOR_COLORS = (
        (1, "twilight"),
        (2, "dracula"),
        (3, "monokai"),
        (4, "default"),
    )

    exercise = models.ForeignKey(Exercise, on_delete=models.CASCADE)
    user = models.ForeignKey('users.ProfileUser', on_delete=models.CASCADE)
    code = models.TextField()
    code_style_indent = models.IntegerField(choices=INDENTS, default=2)
    code_style_color = models.IntegerField(choices=EDITOR_COLORS, default=2)
    last_modification = models.DateTimeField()
    solved = models.BooleanField(default=False)
    submitted = models.BooleanField(default=False)
    like = models.NullBooleanField()
    traceback = models.CharField(max_length=4000, blank=True, null=True)

    def save(self, *args, **kwargs):
        self.last_modification = timezone.now()
        super().save(*args, **kwargs)

    def __str__(self):
        return f"{self.exercise} - {self.user}"


class ExerciseTestUser(models.Model):

    user = models.ForeignKey('users.ProfileUser', on_delete=models.CASCADE)
    exercise_test = models.ForeignKey(ExerciseTest, on_delete=models.CASCADE)
    output = models.CharField(max_length=255, null=True)
    passed = models.NullBooleanField()  # passed > solved


class ExerciseUserComment(models.Model):
    user = models.ForeignKey("users.ProfileUser", on_delete=models.CASCADE)
    exercise = models.ForeignKey(Exercise, on_delete=models.CASCADE)
    message = models.TextField(max_length=4096)
    date = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.user} - {self.exercise.title}"
