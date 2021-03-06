from django.db import models
from django.utils.text import slugify
from django.contrib.auth.models import AbstractUser
import os
from ckeditor.fields import RichTextField


def avatar_path(instance, filename):
    path = "avatars/"
    ext = filename.split(".")[1]
    f_name = "{}.png".format(slugify(instance.username), ext)
    return os.path.join(path, f_name)


class ProgrammingLanguage(models.Model):
    name = models.CharField(max_length=50, unique=True)
    icon = models.ImageField(upload_to="languages/")
    slug = models.SlugField()

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super().save(*args, **kwargs)

    def __str__(self):
        return self.name


class Badge(models.Model):
    title = models.CharField(max_length=50, unique=True)
    description = models.TextField()
    reward_points = models.PositiveIntegerField()
    icon = models.ImageField(upload_to="badges/")

    def __str__(self):
        return self.title


class ProfileUser(AbstractUser):

    LEVELS_EXPERIENCE = (
        (1, 0),
        (2, 500),
        (3, 1100),
        (4, 2000),
        (5, 3000),
        (6, 4500),
        (7, 7000),
        (8, 10000),
        (9, 15000),
        (10, 22500),
        (11, 30000),
        (12, 50000)
    )
    LEVELS = (
        (1, "Basic"),
        (2, "Beginner"),
        (3, "Starter"),
        (4, "Standard"),
        (5, "Enhanced"),
        (6, "Intermediate"),
        (7, "Advanced"),
        (8, "Ultimate"),
        (9, "Extreme"),
        (10, "Professional"),
        (11, "Master"),
        (12, "Pro")
    )

    PROG_LANGS = (
        (1, "Python"),
        (2, "Javascript"),
        (3, "Ruby")
    )

    experience_pts = models.BigIntegerField(default=0)
    level = models.IntegerField(choices=LEVELS, default=1)
    favourite_language = models.ForeignKey(
        ProgrammingLanguage,
        on_delete=models.SET_NULL,
        null=True,
        blank=True
    )
    avatar = models.ImageField(upload_to=avatar_path)
    badges = models.ManyToManyField(Badge, blank=True)

    def name(self):
        return f"{self.first_name} {self.last_name}"

    def __str__(self):
        return self.username

    def next_level_in(self):
        return self.LEVELS_EXPERIENCE[self.level][1] - self.experience_pts

    def current_level_experience_pts(self):
        next_lvl_experience = self.LEVELS_EXPERIENCE[self.level][1]
        current_lvl_experience = self.LEVELS_EXPERIENCE[self.level - 1][1]
        return next_lvl_experience - current_lvl_experience

    def calculate_level(self):
        experience_points = self.experience_pts
        lvl = self.level

        if self.LEVELS_EXPERIENCE[lvl][1] > experience_points:
            return self.level
        else:
            for i, lvl in enumerate(self.LEVELS_EXPERIENCE[lvl: -1], lvl):
                if (self.LEVELS_EXPERIENCE[i + 1][1] > experience_points and
                        experience_points >= lvl[1]):
                    return lvl[0]

    def save(self, *args, **kwargs):
        self.level = self.calculate_level()
        super().save(*args, **kwargs)

    class Meta:
        # email set to required
        unique_together = ("email",)


class UserMessage(models.Model):
    sender = models.ForeignKey(
        ProfileUser,
        related_name="sender",
        on_delete=models.CASCADE
    )
    receiver = models.ForeignKey(
        ProfileUser,
        related_name="receiver",
        on_delete=models.CASCADE
    )
    subject = models.CharField(max_length=200)
    message = RichTextField()
    date_sent = models.DateTimeField(auto_now=True)
    read = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.sender} --> {self.receiver}"
