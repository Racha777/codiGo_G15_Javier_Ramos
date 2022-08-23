const express=require('express');
const {config}=require('./config');
const cors=require('cors');
const { restart } = require('nodemon');

const app=express();

//middlewares
app.use(cors());
app.use(express.json());

app.set('port',config.port);

app.get('/',(req,res)=>{
    res.json({
        status:true,
        content:'servidor activo cursos'
    })
})

//routes
app.use('/curso',require('./routes/curso.routes'));

module.exports=app;