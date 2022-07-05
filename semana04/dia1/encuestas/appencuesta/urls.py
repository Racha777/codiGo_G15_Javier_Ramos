from django.urls import path

from . import views

app_name='appencuesta'

urlpatterns={
    path('',views.mostrar_encuesta),
    path('<int:pregunta_id>',views.pregunta),
    path('enviar',views.enviar_resultado)
}