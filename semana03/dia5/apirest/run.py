from flask import Flask,jsonify,request

app=Flask(__name__)

@app.route('/')
def index():
    context={
        'status':True,
        'content':'Bienvenido a mi api rest con flask y mysql'
    }
    return jsonify(context)

if __name__=="__main__":
    app.run(debug=True,port=5000)