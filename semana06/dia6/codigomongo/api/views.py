from rest_framework.views import APIView
from rest_framework.response import Response

from rest_framework import generics
from rest_framework_mongoengine import generics as drfme_generics

from .models import Alumno,Matricula
from .serializers import AlumnoSerializer,MatriculaSerializer

class AlumnoView(APIView):
    def get(self,request):
        data=Alumno.objects.all()
        serData=AlumnoSerializer(data,many=True)
        return Response(serData.data)

    def post(self,request):
        serData=AlumnoSerializer(data=request.data)
        serData.is_valid(raise_exception=True)
        serData.save()

        return Response(serData.data)

class MatriculaView(drfme_generics.ListCreateAPIView):
    queryset=Matricula.objects.all()
    serializer_class=MatriculaSerializer