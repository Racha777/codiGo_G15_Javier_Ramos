from flask import Flask,render_template,request

app=Flask(__name__)

@app.route('/')
def index():
    strNombre=request.args.get('nom','nn')
    listaPeliculas=['Sonic 2','Star wars','Coda']
    return render_template('index.html',nombre=strNombre,peliculas=listaPeliculas)

app.run(debug=True)