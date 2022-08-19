const express=require('express');
const {config}=require('../config');
const cors=require('cors');

const app=express();

app.use(cors());
app.use(express.json());

/*
app.get('/',(req,res)=>{
    res.json({
        status:true,
        content:'microservicio catalogo listo'
    })
})
*/

app.use('/',require('../routes/usuario.routes'));

app.listen(config.msusuario.port,function(){
    console.log(`ms usuario : http://localhost:${config.msusuario.port}`);
})