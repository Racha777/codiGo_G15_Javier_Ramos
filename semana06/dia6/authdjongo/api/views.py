from rest_framework import generics
from rest_framework.views import APIView
from rest_framework.response import Response
from django.contrib.auth import authenticate
from rest_framework import status

from rest_framework.authtoken.models import Token
from .serializers import UserSerializer

class UserCreateView(generics.CreateAPIView):
    serializer_class=UserSerializer

class LoginView(APIView):
    def post(self,request):
        username=request.data.get("username")
        password=request.data.get("password")

        user=authenticate(username=username,password=password)

        if user:
            Token.objects.create(user=user)
            return Response({
                'token':user.auth_token.key
            })
        else:
            return Response({
                'error':'datos invalidos'
            }, status=status.HTTP_400_BAD_REQUEST)