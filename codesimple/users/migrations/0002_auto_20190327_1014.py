# Generated by Django 2.1.7 on 2019-03-27 10:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='programminglanguage',
            name='icon',
            field=models.ImageField(upload_to='languages/'),
        ),
    ]
