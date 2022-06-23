from flask import Flask,render_template,request,session
from FirebaseAdmin import FirebaseAdmin

fb=FirebaseAdmin()

app=Flask(__name__)

#Clave secreta para variables de sesion
app.secret_key='qwerty123456'

@app.route('/')
def index():
    dictBiografia=fb.getCollection('biografia')[0]
    print(dictBiografia)
    session['biografia']=dictBiografia
    return render_template('index.html',**dictBiografia)

@app.route('/portafolio')
def portafolio():
    listaProyectos=fb.getCollection('proyectos')

    context={
        'proyectos':listaProyectos
    }

    return render_template('portafolio.html',**context)

@app.route('/acercade')
def acercade():
    return render_template('acercade.html')

@app.route('/contacto')
def contacto():
    return render_template('contacto.html')

app.run(debug=True)