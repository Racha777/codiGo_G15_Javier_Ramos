from flask import Flask,render_template
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_USER']='root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'cursos'

mysql=MySQL(app)

@app.route('/')
def index():
    cursor=mysql.connection.cursor()
    sqlNotas = """select a.nombre as alumno,
            COALESCE(n1.nota,0) as HTML,
            COALESCE(n2.nota,0) as JAVASCRIPT,
            COALESCE(n3.nota,0) as REACT,
            COALESCE(n4.nota,0) as PYTHON,
            COALESCE(n5.nota,0) as FLASK,
            COALESCE(n6.nota,0) as MYSQL,
            avg(COALESCE(n.nota,0)) as promedio
            from alumno a
            LEFT join nota n on n.alumno_id = a.id
            LEFT join nota n1 on n1.alumno_id = a.id and n1.curso_id = 1
            LEFT join nota n2 on n2.alumno_id = a.id and n2.curso_id = 2
            LEFT join nota n3 on n3.alumno_id = a.id and n3.curso_id = 3
            LEFT join nota n4 on n4.alumno_id = a.id and n4.curso_id = 4
            LEFT join nota n5 on n5.alumno_id = a.id and n5.curso_id = 5
            LEFT join nota n6 on n6.alumno_id = a.id and n6.curso_id = 6
            GROUP BY a.nombre,n1.nota,n2.nota,n3.nota,n4.nota,n5.nota,n6.nota;"""
    cursor.execute(sqlNotas)
    data = cursor.fetchall()
    cursor.close()

    print(data)
    context = {
        'notas':data
    }
    return render_template('index.html',**context)

app.run(debug=True)