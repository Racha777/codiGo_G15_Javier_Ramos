from rest_framework import serializers

from .models import Alumno,Curso,Evaluacion

class AlumnoSerializer(serializers.ModelSerializer):
    class Meta:
        model=Alumno
        fields='__all__'

class CursoSerializers(serializers.ModelSerializer):
    class Meta:
        model=Curso
        fields='__all__'

class EvaluacionSerializers(serializers.ModelSerializer):
    class Meta:
        model=Evaluacion
        fields='__all__'