from rest_framework.views import APIView
from rest_framework.response import Response

from rest_framework import generics

from .models import Alumno,Curso,Evaluacion
from .serializers import AlumnoSerializer, CursoSerializers, EvaluacionSerializers

class IndexView(APIView):
    def get(self,request):
        context={
            'content':'api rest de sistema codigo'
        }
        return Response(context)

class AlumnoView(generics.ListCreateAPIView):
    queryset=Alumno.objects.all()
    serializer_class=AlumnoSerializer

class AlumnoDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset=Alumno.objects.all()
    serializer_class=AlumnoSerializer

class CursoView(generics.ListCreateAPIView):
    queryset=Curso.objects.all()
    serializer_class=CursoSerializers

class EvaluacionView(generics.ListCreateAPIView):
    queryset=Evaluacion.objects.all()
    serializer_class=EvaluacionSerializers