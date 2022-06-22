from flask import Flask,render_template,request
from GitHubProfile import GitHubProfile

app=Flask(__name__)

@app.route('/')
def index():
    perfil=GitHubProfile()
    context={
        'nombre':perfil.nombre,
        'imagen':perfil.imagen,
        'biografia':perfil.biografia,
        'ubicacion':perfil.ubicacion,
        'github':perfil.github,
        'twitter':perfil.twitter
    }
    return render_template('index.html',**context)

@app.route('/portafolio')
def portafolio():
    return render_template('portafolio.html')

@app.route('/acercade')
def acercade():
    return render_template('acercade.html')

@app.route('/contacto')
def contacto():
    return render_template('contacto.html')

@app.route('/repositorios')
def repositorios():
    perfil=GitHubProfile()
    listaRepositorios=perfil.obtenerRepositorios(10)
    context={
        'repositorios':listaRepositorios
    }
    return render_template('repositorios.html',**context)

app.run(debug=True)