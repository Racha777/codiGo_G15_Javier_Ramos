import dotenv
from flask import Flask,jsonify,request
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
from dotenv import load_dotenv
import os
from os.path import join,dirname

import marshmallow

dotenv_path = join(dirname(__file__),'.env')
load_dotenv(dotenv_path)

app=Flask(__name__) #__name__ es una variable de python quer hace referencia a la aplicacion actual

app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('DATABASE_URI')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db=SQLAlchemy(app)

class Alumno(db.Model):
    id=db.Column(db.Integer,primary_key=True)
    nombre=db.Column(db.String(100),nullable=False)
    email=db.Column(db.String(100),unique=True)

    def __init__(self,nombre,email):
        self.nombre=nombre
        self.email=email

#Migramos las clases a la db, convirtiendolas en tablas
db.create_all()
print("Se crearon las tablas en la base de datos")

#Creamos los esquemas
ma=Marshmallow(app)
class AlumnoSchema(ma.Schema):
    class Meta:
        fields=('id','nombre','email')

alumno_schema=AlumnoSchema()

@app.route('/')
def index():
    return jsonify({
        'status':True,
        'content':'Bienvenido a mi apirest con flask y sqlalchemy'
    })

@app.route('/alumno',methods=['POST'])
def alumno():
    nombre=request.json['nombre']
    email=request.json['email']

    #insertamos el registrpo en base de datos usando el orm
    nuevoAlumno=Alumno(nombre,email)
    db.session.add(nuevoAlumno)
    db.session.commit()

    return alumno_schema.jsonify(nuevoAlumno)

lista_alumnos_schema=AlumnoSchema(many=True)
@app.route('/alumno')
def getAlumno():
    listaAlumnos=Alumno.query.all()
    return jsonify(lista_alumnos_schema.dump(listaAlumnos))

if __name__=="__main__":
    app.run(debug=True,port=5000)