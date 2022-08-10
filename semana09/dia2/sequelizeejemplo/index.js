const express=require('express');

//const sequelize=require('./db');

const {sequelize,Alumnos}=require('./db');

const app=express();
app.use(express.json());

app.get('/',(req,res)=>{
    res.json({
        content:'servidor activo'
    })
})

app.get('/alumno',(req,res)=>{
    //const resultado=Alumnos.findAll();
    //console.log(resultado);
    //res.json(resultado);
    Alumnos.findAll()
    .then(function(resultado){
        console.log(resultado);
        res.json(resultado);
    })
})

app.get('/alumnosql',(req,res)=>{
    sequelize.query('select nombre,email from tbl_alumnos')
    .then((data)=>{
        console.log(data[0]);
        res.json(data[0]);
    })
})

app.post('/alumno',(req,res)=>{
    Alumnos.create(
        {
            nombre:req.body.nombre,
            email:req.body.email
        }
    ).then((alumno)=>{
        res.json(alumno)
    })
})

app.put('/alumno/:id',(req,res)=>{
    Alumnos.findByPk(req.params.id)
    .then(function(alumnos){
        alumnos.update({
            nombre:req.body.nombre,
            email:req.body.email
        }).then(function(alumno){
            res.json(alumno)
        })
    })
})

app.delete('/alumno/:id',(req,res)=>{
    Alumnos.findByPk(req.params.id)
    .then((alumnos)=>{
        alumnos.destroy();
    }).then((alumnos)=>{
        res.sendStatus(201);
    })
})

const port=5000;
app.listen(port,()=>console.log('http://localhost:'+port))