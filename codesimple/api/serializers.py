from rest_framework import serializers


class CodeSerializer(serializers.Serializer):
    """Serializer for code written by user"""

    code = serializers.CharField()
    language = serializers.CharField()
    container_name = serializers.CharField()


class ExerciseUserSerializer(serializers.Serializer):
    """Serializer for receiving informations after running tests"""
    solved = serializers.BooleanField()
    tests = serializers.ListField(
        child=serializers.ListField(
            child=serializers.CharField(),
        ),

    )
    traceback = serializers.CharField(allow_blank=True, allow_null=True)


class ExerciseUserSubmitSerializer(serializers.Serializer):
    message = serializers.CharField(allow_blank=True, allow_null=True)
    new_level = serializers.BooleanField()
