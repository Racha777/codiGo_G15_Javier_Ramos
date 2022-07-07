from django.urls import path
from . import views;
app_name='web'

urlpatterns={
    path('',views.index,name='index'),
    path('producto',views.producto,name='producto'),
    path('carrito',views.carrito,name='carrito'),
    path('login',views.login,name='login'),
}