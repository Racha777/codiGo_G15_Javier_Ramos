from flask import Flask,jsonify
from pymongo import MongoClient
from bson.json_util import dumps

import json

cliente=MongoClient('mongodb://localhost:27017')
db=cliente['db_codigo']
app=Flask(__name__)

@app.route('/')
def index():
    return jsonify({
        'status':True,
        'content':'Bienvenido a mi api rest con flask y mongodb'
    })

@app.route('/alumno')
def getAlumno():
    colAlumnos=db['alumno']

    context={
        'status':True,
        'content':json.loads(dumps(colAlumnos.find({},{"_id":0,"nombre":1,"email":1})))
    }

    return jsonify(context)

app.run(debug=True,port=5000)