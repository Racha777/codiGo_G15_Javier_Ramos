from pyexpat import model
from django.db import models

# Create your models here.
class Autor(models.Model):
    nombre=models.CharField(max_length=200)
    email=models.EmailField(unique=True)

    def __str__(self):
        return self.nombre

class Receta(models.Model):
    titulo=models.CharField(max_length=100)
    ingredientes=models.TextField(help_text='Ingresa los ingredientes')
    preparacion=models.TextField(help_text='Ingresa los pasos de preparacion')
    tiempo_registro=models.DateTimeField(auto_now=True)
    #autor=models.CharField(max_length=200)
    autor=models.ForeignKey(Autor,on_delete=models.CASCADE)

    def __str__(self):
        return self.titulo