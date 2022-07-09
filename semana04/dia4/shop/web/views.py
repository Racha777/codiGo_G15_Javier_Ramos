from django.shortcuts import render,redirect

from .models import Categoria,Marca,Producto

from .carrito import Cart

# Create your views here.
def index(request):
    listaCategorias=Categoria.objects.all()
    listaMarcas=Marca.objects.all()
    listaProductos=Producto.objects.all()
    context={
        'marcas':listaMarcas,
        'categorias':listaCategorias,
        'productos':listaProductos,
    }
    return render(request,'index.html',context)

def producto(request,producto_id):
    objProducto=Producto.objects.get(pk=producto_id)
    context={
        'producto':objProducto
    }
    return render(request,'producto.html',context)

def productosPorCategoria(request,categoria_id):
    objCategoria=Categoria.objects.get(pk=categoria_id)
    listaProductos=objCategoria.producto_set.all()
    listaCategorias=Categoria.objects.all()
    listaMarcas=Marca.objects.all()
    context={
        'marcas':listaMarcas,
        'categorias':listaCategorias,
        'categoria':objCategoria,
        'productos':listaProductos
    }
    return render(request,'index.html',context)

def productosPorMarca(request,marca_id):
    objMarca=Marca.objects.get(pk=marca_id)
    listaProductos=objMarca.producto_set.all()
    listaCategorias=Categoria.objects.all()
    listaMarcas=Marca.objects.all()
    context={
        'marcas':listaMarcas,
        'categorias':listaCategorias,
        'marca':objMarca,
        'productos':listaProductos
    }
    return render(request,'index.html',context)

def productosPorNombre(request):
    nombre=request.POST['nombre']
    listaProductos=Producto.objects.filter(nombre__contains=nombre)
    listaCategorias=Categoria.objects.all()
    listaMarcas=Marca.objects.all()
    context={
        'marcas':listaMarcas,
        'categorias':listaCategorias,
        'productos':listaProductos
    }
    return render(request,'index.html',context)

######CARRITO DE COMPRAS

def carrito(request):
    return render(request,'carrito.html')

def agregarCarrito(request,producto_id):
    if request.method=='POST':
        cantidad=int(request.POST['cantidad'])
    else:
        cantidad=1
    objProducto=Producto.objects.get(pk=producto_id)
    carritoProducto=Cart(request)
    carritoProducto.add(objProducto,cantidad)
    print(request.session.get("cart"))

    return render(request,'carrito.html')

def eliminarProductoCarrito(request,producto_id):
    objProducto=Producto.objects.get(pk=producto_id)
    carritoProducto=Cart(request)
    carritoProducto.delete(objProducto)

    return render(request,'carrito.html')

def limpiarCarrito(request):
    carritoProducto=Cart(request)
    carritoProducto.clear()

    return render(request,'carrito.html')


####################

from django.contrib.auth.models import User
from django.contrib.auth import login,logout,authenticate

def crearUsuario(request):
    if request.method=="POST":
        dataUsuario=request.POST['nuevoUsuario']
        dataPassword=request.POST['nuevoPassword']

        nuevoUsuario=User.objects.create_user(username=dataUsuario,password=dataPassword)
        if nuevoUsuario is not None:
            login(request,nuevoUsuario)
            return redirect('/cuenta')

        return render(request,'login.html')

def loginUsuario(request):
    context={}
    if request.method=='POST':
        dataUsuario=request.POST['usuario']
        dataPassword=request.POST['password']

        usuarioAuth=authenticate(request,username=dataUsuario,password=dataPassword)
        if usuarioAuth is not None:
            login(request,usuarioAuth)
            return redirect('/cuenta')
        else:
            context={
                'error':'datos incorrectos'
            }
    
    return render(request,'login.html',context)

def logoutUsuario(request):
    logout(request)
    return render(request,'login.html')

def cuentaUsuario(request):
    context={}
    return render(request,'cuenta.html',context)