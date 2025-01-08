from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)

from django.urls import path
from . import views


app_name = 'accounts'
urlpatterns = [
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),

    path('sign-up/', views.UserListCreateAPIView.as_view(), name='sign_up'),
    path('verify/', views.VerifyAPIView.as_view(), name='verify'),
]

