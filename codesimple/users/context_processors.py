from users.models import UserMessage


def notifications(request):
    if not request.user.is_anonymous:
        notifications = UserMessage.objects.filter(
            receiver=request.user, read=False)

        ctx = {
            "notifications": notifications,
            "notifications_number": notifications.count()
        }
        return ctx
    return {}
