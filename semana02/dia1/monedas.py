from flask import Flask,request
from tipoCambioSbs import TipoCambioSbs
app=Flask(__name__)

@app.route('/')
def index():
    estilo='<style>'
    estilo+='table,th,td { border : 1px solid; }'
    estilo+='</style>'
    tipoCambio=TipoCambioSbs()
    resultado=estilo+'<center><h1>TIPOS DE CAMBIO DEL DIA - SBS</h1>'
    resultado+=tipoCambio.obtenerTipoCambio()
    resultado+='</center>'
    return resultado

app.run(debug=True)