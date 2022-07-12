from django.contrib import admin

# Register your models here.
from .models import Alumno,Profesor

admin.site.register(Alumno)
admin.site.register(Profesor)