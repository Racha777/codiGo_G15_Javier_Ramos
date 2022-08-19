const express = require('express');
const {config} = require('./config');
const cors = require('cors');

const fileUpload = require('express-fileupload');

const app = express();

//middlewares
app.use(cors());
app.use(fileUpload());
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
app.use('/usuario',require('./routes/usuario.routes'));

module.exports = app;