from django.urls import path

from . import views

urlpatterns=[
    path('',views.index),
    path('alumno',views.alumnos),
    path('home',views.home),
    path('getalumno',views.getAlumnos),
    path('setalumno',views.setAlumno),
    path('getprofesores',views.getProfesores),
    path('profesor',views.profesor),
    path('profesor/<int:profesor_id>',views.profesor_detail),
]