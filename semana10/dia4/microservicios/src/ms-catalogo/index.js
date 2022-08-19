const express=require('express');
const {config}=require('../config');
const cors=require('cors');
require('../lib/mongoose.lib');

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

app.use('/',require('../routes/producto.routes'));

app.listen(config.mscatalogo.port,function(){
    console.log(`ms catalogo : http://localhost:${config.mscatalogo.port}`);
})