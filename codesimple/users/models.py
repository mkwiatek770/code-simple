from django.db import models
from django.utils.text import slugify


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
