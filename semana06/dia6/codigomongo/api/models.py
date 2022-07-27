#from django.db import models
from mongoengine import Document,fields,EmbeddedDocument

# Create your models here.
class Alumno(Document):
    nombre=fields.StringField()
    email=fields.EmailField()
    celular=fields.StringField()
    github=fields.StringField()

class Curso(EmbeddedDocument):
    nombre=fields.StringField(required=True)

class Matricula(Document):
    nro=fields.StringField(required=True)
    alumno=fields.ReferenceField('Alumno')
    cursos=fields.ListField(fields.EmbeddedDocumentField(Curso))