from flask import Flask,jsonify
from bson.json_util import dumps
from flask_pymongo import PyMongo

import os
from dotenv import load_dotenv
load_dotenv()

import json

app=Flask(__name__)

app.config["MONGO_URI"]=os.getenv('MONGO_URI')

mongo=PyMongo(app)

@app.route('/')
def index():
    return jsonify({
        'status':True,
        'content':'Bienvenido a mi api rest con flask y mongodb'
    })

@app.route('/alumno')
def getAlumno():
    colAlumnos=mongo.db.alumno.find({},{"_id":0,"nombre":1,"email":1})

    context={
        'status':True,
        'content':json.loads(dumps(colAlumnos))
    }

    return jsonify(context)

app.run(debug=True,port=5000)