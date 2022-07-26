from mongoengine import *
import os
from dotenv import load_dotenv

load_dotenv()


connect(host=os.getenv('MONGO_URI'))

#creamos clases basadas en documentos
class Usuario(Document):
    usuario=StringField(required=True)
    password=StringField(required=True)

nuevoUsuario=Usuario()
nuevoUsuario.usuario='Brigitte Chang'
nuevoUsuario.password='963852'
nuevoUsuario.save()

for usu in Usuario.objects:
    print(usu.usuario)