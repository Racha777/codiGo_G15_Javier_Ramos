const express =require('express');
const {config}=require('./config');
const cors=require('cors');

const alumnoApi=require('./routes/alumno.routes');
const cursoApi=require('./routes/curso.routes');

const app=express();

app.use(cors());
//Para recibir data en json
app.use(express.json());

app.get('/',(req,res)=>{
    res.json({
        'status':true,
        'content':"servidor activo"
    })
})

alumnoApi(app);
cursoApi(app);

app.listen(config.port,()=>console.log('servidor en http://localhost:'+config.port));