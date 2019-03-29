from django.test import TestCase
from django.urls import reverse
from users.models import ProfileUser, Badge
from exercise.models import Tag, Exercise
import mock
from django.core.files import File

LANDING_URL = reverse("index")
HOME_URL = reverse("home")


class TestLandingPageView(TestCase):
    """Tests for LandingPageView"""

    def setUp(self):
        file_mock = mock.MagicMock(spec=File, name='FileMock')
        file_mock.name = 'test1.png'
        self.user = ProfileUser.objects.create(
            username="username",
            password="password",
            email="somemail@o2.pl",
            avatar=file_mock
        )

    def test_not_logged_user(self):
        """Test GET method for not logged user"""
        response = self.client.get(LANDING_URL, follow=True)

        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, "exercise/index.html")

    def test_logged_user(self):
        """Test GET method for  logged user"""
        self.client.force_login(self.user)
        response = self.client.get(LANDING_URL, follow=True)

        self.assertEqual(response.status_code, 200)
        self.assertRedirects(response, HOME_URL)
        self.assertTemplateUsed(response, "exercise/home.html")


class TestHomeView(TestCase):
    """Tests for HomeView"""

    def create_tag(self, name):
        """Create tag with given name"""
        return Tag.objects.create(
            name=name
        )

    def create_exercise_with_tag(self, title, tag):
        exercise = Exercise.objects.create(
            title=title,
            image_name="image",
            short_description="short",
            description="description",
            level=1,
            experience_points=100
        )
        exercise.tags.add(tag)
        exercise.save()
        return exercise

    def create_badge(self):
        return Badge.objects.create(
            title="First Achieve",
            description="desc..",
            reward_points=100,
            icon="icon.png"
        )

    def setUp(self):
        self.badge = self.create_badge()

        file_mock = mock.MagicMock(spec=File, name='FileMock')
        file_mock.name = 'test1.png'
        self.user = ProfileUser.objects.create(
            username="username",
            password="password",
            email="email@gmail.com",
            avatar=file_mock,
        )

    def test_get_logged_in(self):
        """Test GET method for logged user """

        self.client.force_login(self.user)
        response = self.client.get(HOME_URL, follow=True)

        self.assertEqual(response.status_code, 200)
        # first_login achievement

        self.assertIn("achievements", response.context)
        self.assertEqual(response.context["achievements"][0], self.badge)

    def test_get_not_logged_in(self):
        """Test GET method for not logged user"""

        response = self.client.get(HOME_URL, follow=True)

        self.assertEqual(response.status_code, 200)
        self.assertRedirects(response, LANDING_URL)
        self.assertTemplateUsed(response, "exercise/index.html")

    def test_post_filter(self):
        """Test POST method for filtering exercises"""

        self.client.force_login(self.user)
        t1 = self.create_tag("name1")
        t2 = self.create_tag("name2")
        exercise1 = self.create_exercise_with_tag("exercise1", t1)
        exercise2 = self.create_exercise_with_tag("exercise2", t2)

        response = self.client.post(HOME_URL, data={
            "filter": [""],
            "tag": "{}".format(t1.id),
            "level": "all",
            "language": "all"
        })

        self.assertEqual(response.status_code, 200)
        self.assertIn(exercise1, response.context["exercises"])
        self.assertNotIn(exercise2, response.context["exercises"])

    def test_post_search(self):
        """Test POST method for searching exercises"""

        self.client.force_login(self.user)
        t1 = self.create_tag("name1")
        t2 = self.create_tag("name2")
        exercise1 = self.create_exercise_with_tag("exercise1", t1)
        exercise2 = self.create_exercise_with_tag("exercise2", t2)

        response = self.client.post(HOME_URL, data={
            "search": [""],
            "phrase": "exercise1"
        })

        self.assertEqual(response.status_code, 200)
        self.assertIn(exercise1, response.context["exercises"])
        self.assertNotIn(exercise2, response.context["exercises"])
