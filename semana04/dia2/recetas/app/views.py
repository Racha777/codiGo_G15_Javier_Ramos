from django.shortcuts import render,redirect

from .models import Receta
from .forms import RecetaForm,AutorForm

# Create your views here.
def index(request):
    listaRecetas=Receta.objects.all() #select * from app_receta
    print(listaRecetas)

    frmReceta=RecetaForm()
    frmAutor=AutorForm()

    context={
        'frmAutor':frmAutor,
        'frmReceta':frmReceta,
        'recetas':listaRecetas
    }
    return render(request,'index.html',context)

def registrarReceta(request):
    frmReceta=RecetaForm(request.POST)
    if frmReceta.is_valid():
        #crear nueva receta
        dataReceta=frmReceta.cleaned_data
        print(dataReceta)
        #insertar receta nueva
        nuevaReceta=Receta()
        nuevaReceta.titulo=dataReceta['titulo']
        nuevaReceta.ingredientes=dataReceta['ingredientes']
        nuevaReceta.preparacion=dataReceta['preparacion']
        nuevaReceta.autor=dataReceta['autor']
        nuevaReceta.save()

    return redirect('/')

def registrarAutor(request):
    frmAutor=AutorForm(request.POST)
    if frmAutor.is_valid():
        frmAutor.save()
    return redirect('/')