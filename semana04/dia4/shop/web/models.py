from django.db import models

# Create your models here.
class Categoria(models.Model):
    nombre = models.CharField(max_length=200)
    fecha_registro = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.nombre

class Marca(models.Model):
    nombre = models.CharField(max_length=200)
    fecha_registro = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.nombre

class Producto(models.Model):
    categoria = models.ForeignKey(Categoria,on_delete=models.RESTRICT)
    marca = models.ForeignKey(Marca,on_delete=models.RESTRICT)
    sku = models.CharField(max_length=20,null=True)
    nombre = models.CharField(max_length=200)
    descripcion = models.TextField(null=True)
    peso = models.IntegerField(default=0,null=True)
    dimension = models.CharField(max_length=100,null=True)
    color = models.CharField(max_length=200,null=True)
    precio = models.DecimalField(max_digits=9,decimal_places=2)
    fecha_registro = models.DateTimeField(auto_now_add=True)
    imagen = models.ImageField(upload_to='productos',blank=True)

    def __str__(self):
        return self.nombre