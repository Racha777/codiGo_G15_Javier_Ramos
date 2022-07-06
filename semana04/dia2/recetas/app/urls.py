from django.urls import path

from . import views

app_name='app'

urlpatterns=[
    path('',views.index),
    path('registrarReceta',views.registrarReceta,name='registrarReceta'),
    path('registrarAutor',views.registrarAutor,name='registrarAutor'),
]