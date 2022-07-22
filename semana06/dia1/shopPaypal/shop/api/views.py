from urllib import request
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status

from web.models import (
    Categoria,
    Marca,
    Producto
)

from .serializers import CategoriaSerializer, MarcaSerializer, ProductoSerializer

@api_view(['GET'])
def index(request):
    context={
        'status':True,
        'content':'Api rest de Shop'
    }

    return Response(context)

@api_view(['GET'])
def categoria(request):
    dataCategoria=Categoria.objects.all()
    serCategoria=CategoriaSerializer(dataCategoria,many=True)

    context={
        'status':True,
        'content':serCategoria.data
    }

    return Response(context,status=status.HTTP_200_OK)

@api_view(['GET'])
def marca(request):
    dataMarca=Marca.objects.all()
    serMarca=MarcaSerializer(dataMarca,many=True)

    context={
        'status':True,
        'content':serMarca.data
    }

    return Response(context,status=status.HTTP_200_OK)

@api_view(['GET'])
def producto(request):
    dataProducto=Producto.objects.all()
    serProducto=ProductoSerializer(dataProducto,many=True)

    context={
        'status':True,
        'content':serProducto.data
    }

    return Response(context,status=status.HTTP_200_OK)