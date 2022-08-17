const express=require('express');
const {config}=require('./config');
const cors=require('cors');

const app=express();
app.use(cors());
app.use(express.json());

app.set('port',config.port);

app.get('/',(req,res)=>{
    res.json({
        status:true,
        content:'servidor activo'
    })
})

//rutas
app.use('/producto',require('./routes/producto.routes'));

module.exports=app;