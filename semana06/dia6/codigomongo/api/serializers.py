from rest_framework_mongoengine.serializers import DocumentSerializer

from .models import Alumno,Matricula

class AlumnoSerializer(DocumentSerializer):
    class Meta:
        model=Alumno
        fields=('id','nombre','email','celular','github')
        extra_kwargs={'id':{'read_only':True}}

class MatriculaSerializer(DocumentSerializer):
    class Meta:
        model=Matricula
        fields=('nro','alumno','cursos')
        extra_kwargs={'id':{'read_only':True}}