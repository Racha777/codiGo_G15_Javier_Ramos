from django.contrib import admin

# Register your models here.
from .models import Receta,Autor

admin.site.register(Receta)
admin.site.register(Autor)