from django.db import models

# Create your models here.
class Alumno(models.Model):
    nombre=models.CharField(max_length=200)
    email=models.EmailField(unique=True)

class Profesor(models.Model):
    nombre=models.CharField(max_length=200)
    email=models.EmailField(unique=True)
    direccion=models.CharField(max_length=200)
    telefono=models.CharField(max_length=10)
    dni=models.CharField(max_length=8,unique=True)