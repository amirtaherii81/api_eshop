import random
from django.shortcuts import render

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from .models import CustomUser
from .serializers import UserSerializer, VerifySerializer


class UserListCreateAPIView(APIView):
    def get(self, request):
        users = CustomUser.objects.filter(is_active=True)
        data = UserSerializer(users, many=True).data
        return Response(data)

    def post(self, request):
        serializer = UserSerializer(data=request.data)
        if not serializer.is_valid():
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        if CustomUser.objects.filter(mobile_number=serializer.validated_data['mobile_number']).exists():
            return Response({'error': 'این شماره موبایل قبلاً ثبت‌نام شده است.'}, status=status.HTTP_400_BAD_REQUEST)

        user = serializer.save()
        request.session['user_session'] = {
            'mobile_number': user.mobile_number,
            'active_code': user.active_code
        }
        
        return Response(
            {"message": "User registered successfully.", "redirect_url": "/accounts/verify/"},
            status=status.HTTP_201_CREATED
            )


class VerifyAPIView(APIView):
    def post(self, request):
        serializer = VerifySerializer(data=request.data)
        if not serializer.is_valid():
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        
        user_session = request.session.get('user_session', {})
        mobile_number = user_session.get('mobile_number')
        # active_code = user_session.get('active_code')

        
        try:
            user = CustomUser.objects.get(mobile_number=mobile_number)
        
        except CustomUser.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)
         
        
        if active_code != serializer.validated_data['active_code']:
            return Response('کد اعتباری اشتباه است')
        
        if user.is_active:
            return Response({'error': 'این کاربر قبلاً فعال شده است.'}, status=status.HTTP_400_BAD_REQUEST)
        
        user.active_code = random.randint(1000, 9999)
        user.is_active = True
        user.save()



