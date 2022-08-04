//console.log('Mi primer proyecto');
const express=require('express');

const app=express();
const port=5000;

app.use(express.static('public'));

app.get('/',(req,res)=>{
    res.send('<h1><center>Mi primer servidor web con express</center></h1>');
})

app.get('/hola:nombre',(req,res)=>{
    res.send('<center><b>Hola '+req.params.nombre+'</b></center>');
})

app.get('/saludojson',(req,res)=>{
    res.json({
        'saludo':'hola',
    })
})

app.listen(port,function(){
    console.log('servidor activo en http://loclahost:'+port);
})