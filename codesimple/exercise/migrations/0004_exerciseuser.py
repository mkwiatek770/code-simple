# Generated by Django 2.1.7 on 2019-03-27 14:02

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('exercise', '0003_exerciseusercomment'),
    ]

    operations = [
        migrations.CreateModel(
            name='ExerciseUser',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('code', models.TextField()),
                ('code_style_indent', models.IntegerField(choices=[('one', 1), ('two', 2), ('four', 4)], default=2)),
                ('code_style_color', models.IntegerField(choices=[(1, 'twilight'), (2, 'dracula'), (3, 'monokai'), (4, 'default')], default=2)),
                ('last_modification', models.DateTimeField()),
                ('solved', models.BooleanField(default=False)),
                ('submitted', models.BooleanField(default=False)),
                ('like', models.NullBooleanField()),
                ('traceback', models.CharField(blank=True, max_length=4000, null=True)),
                ('exercise', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='exercise.Exercise')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]