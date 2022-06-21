from flask import Flask,request

app=Flask(__name__)

@app.route('/')
def index():
    return '<center><h1>Bienvenido a mi web on Flask</h1></center>'

@app.route('/saludo')
def saludo():
    nombre=request.args.get('nombre','no hay nombre')
    return '<center><b>Hola {}</b></center>'.format(nombre)

@app.route('/suma')
def suma():
    n1=request.args.get('n1','0')
    n2=request.args.get('n2','0')
    resultado=int(n1)+int(n2)
    return '<center><b>la suma de {} + {} es {}</b></center>'.format(n1,n2,resultado)

@app.route('/resta/<int:n1>/<int:n2>')
def resta(n1=0,n2=0):
    resultado=n1-n2
    return '<center><b>la resta de {} - {} es {}</b></center>'.format(n1,n2,resultado)

@app.route('/calculadora',methods=['GET','POST'])
def calculadora():
    form="<form action='calculadora' method='POST'>"
    form+="<input type='text' name='n1' size='2'>"
    form+=" + <input type='text' name='n2' size='2'>"
    form+="<input type='submit' value='='/>"

    if request.method=='POST':
        n1=request.form['n1']
        n2=request.form['n2']
        resultado=int(n1)+int(n2)
        form+='<h2>la suma de {} + {} es {}</h2>'.format(n1,n2,resultado)

    return form

app.run(debug=True)