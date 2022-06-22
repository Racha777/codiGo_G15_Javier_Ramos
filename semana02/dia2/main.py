from flask import Flask,render_template

app=Flask(__name__)

@app.route('/')
def index():
    strNombre='cesar'
    return render_template('index.html',nombre=strNombre)

app.run(debug=True)