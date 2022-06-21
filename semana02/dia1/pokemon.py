from flask import Flask,render_template,request
import requests
import json

BASE_URL = 'http://pokeapi.co/api/v2/pokemon/'

def consultarPokedApi(nombrePokemon):
    url = BASE_URL + nombrePokemon
    response = requests.get(url)

    if response.status_code == 200:
        return json.loads(response.text)
    else:
        return None

app=Flask(__name__)

listaPokemon = ['pikachu','charmander','snorlax','bulbasaur']

@app.route('/')
def index():
    listaDataPokemon = []
    for buscarpokemon in listaPokemon:
        dataPokemon = consultarPokedApi(buscarpokemon)
        if dataPokemon == None:
            pass
        else:
            sprites = dataPokemon['sprites']
            imagen = sprites['front_default']
            dicPokemon = {
                'nombre':buscarpokemon,
                'imagen':imagen
            }
            listaDataPokemon.append(dicPokemon)

    return render_template('index.html',pokemon=listaDataPokemon)


app.run(debug=True)