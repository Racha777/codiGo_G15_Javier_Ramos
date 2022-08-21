from django.urls import path
from . import views

urlpatterns=[
    path('',views.IndexView.as_view()),
    path('categoria',views.CategoriaView.as_view()),
    path('curso',views.CursoView.as_view()),
    path('categoria/<int:categoria_id>/cursos',views.CategoriaCursoView.as_view()),
    path('usuario/create',views.UserCreateView.as_view()),
    path('miembro/create',views.MiembroCreateView.as_view())
]