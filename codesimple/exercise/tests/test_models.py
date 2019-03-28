from django.test import TestCase
from django.utils.text import slugify
from exercise.models import (
    Tag,
    Exercise,

)


class TestsTag(TestCase):
    """Tests for Tag model"""

    def test_str_representation(self):
        """Test Tag object str representation"""
        tag = Tag.objects.create(
            name="Tag"
        )

        self.assertIsInstance(tag, Tag)
        self.assertEqual(tag.__str__(), tag.name)
        self.assertEqual(len(Tag.objects.all()), 1)

    def test_slug(self):
        """Test that slug of Tag instance is created properly"""
        name = "Some tAg"
        tag = Tag.objects.create(
            name=name
        )

        self.assertEqual(tag.slug, slugify(name))


class TestsExercise(TestCase):
    """Tests for Exercise model"""

    def setUp(self):
        self.title = "Some Title"
        self.exercise = Exercise.objects.create(
            title=self.title,
            image_name="some_image",
            short_description="desc..",
            description="description",
            level=1,
            experience_points=200,
        )

    def test_str_representation(self):
        """Test string representaion of Exercise object"""
        self.assertIsInstance(self.exercise, Exercise)
        self.assertEqual(self.exercise.__str__(), self.title)

    def test_slug(self):
        """Test creating slug while saving object"""
        self.assertEqual(self.exercise.slug, slugify(self.title))
