# code-simple
---
.. image:: https://travis-ci.org/mkwiatek770/code-simple.png
    :target: https://travis-ci.org/Tivix/code-simple

App to practice programming skills, and compete with friends. Exercises with many difficulty levels. Every one will find suitable exercise for its skill. Compare your progress with friends.

## Technology Stack
* Docker
* Django 2.1
* Python 3.6 +
* Django Rest Framework
* TravisCI
* Javascript
* PostgreSQL

## How does it work?
Every exercise related with specific user is docker container which keeps, exercse content and exercise tests. Django project(cordinator) orchestrate containers using python `docker` library. Frontend application communicates with django using AJAX calls to REST API endpoints. More on picture in Wiki.

## Requirements
* Python 3.6+
* Docker
* PostgreSQL

## Installing
*This* *is* *installation* *for* *Linux* *OS,* *commands* *for* *different* *OS* *might* *slightly* *change*
1. Clone Git repository
2. Create virtualenv with python 3.6 `virtualenv -p python3.6 venv`
3. Activate virtualenv using `source venv/bin/activate`
4. Setup psql database with name `code_simple`
5. Populate database `psql -U postgres -f db_dump.sql -h localhost code_simple`
6. `python manage.py makemigrations`
7. `python manage.py migrate`

You are ready to go :)


