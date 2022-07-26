import dotenv
from flask import Flask,jsonify,request
from flask_mongoengine import MongoEngine
#from marshmallow_mongoengine import ModelSchema
from marshmallow import Schema,fields
#import marshmallow_mongoengine as ma
from dotenv import load_dotenv
import os
from os.path import join,dirname

import marshmallow

dotenv_path = join(dirname(__file__),'.env')
load_dotenv(dotenv_path)

app=Flask(__name__) #__name__ es una variable de python quer hace referencia a la aplicacion actual

app.config['MONGODB_SETTINGS']={
    "db":"db_demo",
}
db=MongoEngine(app)

class Alumno(db.Document):
    nombre=db.StringField()
    email=db.StringField()

#Creamos los esquemas
#class AlumnoSchema(ModelSchema):
#    class Meta:
#        model=Alumno

#alumno_schema=AlumnoSchema()

class AlumnoSchema(Schema):
    nombre=fields.Str()
    email=fields.Str()

alumno_schema=AlumnoSchema()
alumnos_schema=AlumnoSchema(many=True)

@app.route('/')
def index():
    return jsonify({
        'status':True,
        'content':'Bienvenido a mi apirest con flask y mongoengine'
    })

@app.route('/alumno',methods=['POST'])
def alumno():
    nombre=request.json['nombre']
    email=request.json['email']

    #insertamos el registrpo en base de datos usando el orm
    nuevoAlumno=Alumno()
    nuevoAlumno.nombre=nombre
    nuevoAlumno.email=email
    nuevoAlumno.save()

    dump_data=alumno_schema.dump(nuevoAlumno)

    return dump_data

#Metodo para consultar varios alumnos
lista_alumnos_schema=AlumnoSchema(many=True)

@app.route('/alumno')
def getAlumno():
    listaAlumnos=[]
    for usu in Alumno.objects:
        dicAlumno={
            'nombre':usu.nombre,
            'email':usu.email
        }
        listaAlumnos.append(dicAlumno)

    dump_data=jsonify(listaAlumnos)

    return dump_data

if __name__=="__main__":
    app.run(debug=True,port=5000)