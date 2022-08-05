const express=require('express');
const cors=require('cors');

const mysqlConnection=require('./database')

const app=express();
const port=5000;

app.use(cors());
//permite qye el servidor reciba data en json
app.use(express.json());

app.get('/',(req,res)=>{
    res.json({
        'status':true,
        'content':"Mi primer app web con  express js Javier Ramos"
    })
})

//api rest de alumnos
app.get('/alumno',(req,res)=>{
    mysqlConnection.query('select * from tbl_alumno',(err,rows,fields)=>{
        if(err){
            console.log(err);
        }else{
            res.json(rows);
        }
    })
})

app.post('/alumno',(req,res)=>{
    const {nombre,email}=req.body
    const query=`insert into tbl_alumno(alumno_nombre,alumno_email)
                values('${nombre}','${email}')`;

    mysqlConnection.query(query,(err,rows,fields)=>{
        if(!err){
            const querynewAlumno='select * from tbl_alumno order by alumno_id desc limit 1';
            mysqlConnection.query(querynewAlumno,(err,rows,fields)=>{
                res.json(rows[0]);
            })
        }else{
            console.log(err);
        }
    })
})

app.put('/alumno/:id',(req,res)=>{
    const{nombre,email}=req.body;
    const{id}=req.params;//pasa los que estan en la ruta url /:id

    const query="update tbl_alumno set alumno_nombre=?,alumno_email=? where alumno_id=?";

    mysqlConnection.query(query,[nombre,email,id],
        (err,rows,fields)=>{
            if(!err){
                res.json({
                    'status':true,
                    'content':"alumno actualizado"
                })
            }else{
                console-log(err);
            }
        });
})

app.delete('/alumno/:id',(req,res)=>{
    const {id}=req.params;

    const query="delete from tbl_alumno where alumno_id=?";

    mysqlConnection.query(query,[id],(err,rows,fields)=>{
        if(!err){
            res.json({
                'status':true,
                'content':"alumno eliminado",
            })
        }else{
            console.log(err);
        }
    })
})

app.listen(port,()=>{
    console.log('servidor activo en http://loacalhost:'+port)
})