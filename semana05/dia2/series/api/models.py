from django.db import models

# Create your models here.
class Serie(models.Model):

    CATEGORIAS_CHOICES=(
        ('horror','Horror'),
        ('comedia','Comedia'),
        ('accion','Accion'),
        ('drama','Drama')
    )

    nombre=models.CharField(max_length=200)
    fecha_registro=models.DateField()
    rating=models.IntegerField(default=0)
    categoria=models.CharField(max_length=10,choices=CATEGORIAS_CHOICES)

    def __str__(self):
        return self.nombre