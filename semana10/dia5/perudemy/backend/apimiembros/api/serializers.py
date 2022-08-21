from dataclasses import fields
from rest_framework import serializers

from .models import *

class CategoriaSerializer(serializers.ModelSerializer):
    class Meta:
        model=Categoria
        fields='__all__'

class CursoSerializer(serializers.ModelSerializer):
    class Meta:
        model=Curso
        fields='__all__'

class MiembroSerializer(serializers.ModelSerializer):
    class Meta:
        model=Miembro
        fields='__all__'

class CategoriaCursoSerializer(serializers.ModelSerializer):
    Cursos=CursoSerializer(many=True,read_only=True)

    class Meta:
        model=Categoria
        fields=['categoria_id','categoria_nombre','Cursos']

from django.contrib.auth.models import User

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model=User
        fields=('username','first_name','last_name','email','password')
        extra_kwargs={'password':{'write_only':True}}

    def create(self,validated_data):
        user=User(
            email=validated_data['email'],
            first_name=validated_data['first_name'],
            last_name=validated_data['last_name'],
            username=validated_data['username'],
        )
        user.set_password(validated_data['password'])
        user.save()
        return user