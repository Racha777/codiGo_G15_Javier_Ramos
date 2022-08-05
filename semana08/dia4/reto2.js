const express=require('express');

const mysqlConnection=require('./database');

const app=express();
const port=5000;

app.use(express.json());

app.get('/curso',(req,res)=>{
    mysqlConnection.query('select * from tbl_curso',(err,rows,fields)=>{
        if(!err){
            res.json(rows);
        }else{
            console.log(err);
        }
    })
});

app.post('/curso',(req,res)=>{
    const {nombre}=req.body;
    const query=`insert into tbl_curso (curso_nombre) values('${nombre}')`;

    mysqlConnection.query(query,(err,rows,fields)=>{
        if(!err){
            res.json({
                "status":true,
                "content":"Curso registrado"
            });
        }else{
            console.log(err);
        }
    })
})

app.put('/curso/:id',(req,res)=>{
    const {nombre}=req.body;
    const {id}=req.params;
    const query=`update tbl_curso set curso_nombre=? where curso_id=?`;

    mysqlConnection.query(query,[nombre,id],(err,rows,fields)=>{
        if(!err){
            res.json({
                'status':true,
                'content':"Curso actualizado"
            })
        }else{
            console.log(err);
        }
    })
})

app.delete('/curso/:id',(req,res)=>{
    const {id}=req.params;
    const query=`delete from tbl_curso where curso_id=?`;

    mysqlConnection.query(query,[id],(err,rows,fields)=>{
        if(!err){
            res.json({
                'status':true,
                'content':"Curso eliminado"
            })
        }else{
            console.log(err);
        }
    })
})

app.listen(port,()=>{
    console.log('servidor activo en http://loacalhost:'+port)
})