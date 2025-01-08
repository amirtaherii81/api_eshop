from .models import CustomUser
from rest_framework import serializers

class UserSerializer(serializers.ModelSerializer):
    password = serializers.CharField(max_length=50, write_only=True)
    confirm_password = serializers.CharField(max_length=50, write_only=True)
    
    class Meta:
        model = CustomUser
        fields = ['mobile_number', 'password', 'confirm_password']


    def validate(self, attrs):
        password = attrs.get('password')
        confirm_password = attrs.get('confirm_password')

        if password != confirm_password:
            raise serializers.ValidationError({"confirm_password": "Passwords do not match."})

        return attrs

    def create(self, validated_data):
        # حذف confirm_password از داده‌های معتبر
        validated_data.pop('confirm_password', None)
        user = CustomUser.objects.create_user(**validated_data)
        return user


class VerifySerializer(serializers.Serializer):
    active_code = serializers.CharField(max_length=100)