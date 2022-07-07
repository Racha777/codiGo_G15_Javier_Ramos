from django.shortcuts import render

# Create your views here.
def index(request):
    return render(request,"index.html")

def producto(request):
    return render(request,"producto.html")

def carrito(request):
    return render(request,"carrito.html")

def login(request):
    return render(request,"login.html")