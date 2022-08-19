const express = require('express');
const {config} = require('./config');
const cors = require('cors');
const session = require('express-session')

const fileUpload = require('express-fileupload');

const app = express();

app.use(session({
    secret: 'somethingsecretgoeshere',
    resave: false,
    saveUninitialized: true,
    cookie: { secure: true }
 }));

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
app.use('/auth',require('./routes/auth.routes'));

module.exports = app;