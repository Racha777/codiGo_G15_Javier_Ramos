const express=require('express');
const {config}=require('./config');

//Importamos middlewares
const cors=require('cors');
const {logRequest}=require('./middlewares/logs.handler');
const {errorHandler}=require('./middlewares/error.handler');

const app=express();
app.use(logRequest);
app.set('port',config.port);

//middlewares
app.use(cors())
app.use(express.json());

app.get('/',(req,res)=>{
    res.json({
        status:true,
        content:"Servidor activo"
    })
})

//rutas
app.use('/tarea',require('./routes/tarea.route'));
app.use('/usuario',require('./routes/usuario.route'));

//middlewares de errores
app.use(errorHandler);
module.exports=app;