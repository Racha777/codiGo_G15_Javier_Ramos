from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def mostrar_encuesta(request):
    #return HttpResponse('<center><h1>Encuesta 1</h1></center>')
    return render(request, 'index.html')

def pregunta(request,pregunta_id):
    return HttpResponse('pregunta nro %s' % pregunta_id)

def enviar_resultado(request):
    nombre=request.POST['nombre']
    rol=request.POST['rol']
    idiomas=request.POST.getlist('idiomas')

    context={
        'nombre':nombre,
        'rol':rol,
        'idiomas':idiomas
    }

    return render(request,'respuesta.html',context)