{% extends "mail_templated/base.tpl" %}

{% block subject %}
CodeSimple - Activate your account.
{% endblock %}

{% block body %}
Hello {{ user.username }}
Please click on the link to confirm your registration.
{% endblock %}

{% block html %}
Hello {{ user.username }}
Please click on the link to confirm your registration.
<a href="http://{{ domain }}{% url 'activate' uidb64=uid token=token %}">Activate</a>
{% endblock %}