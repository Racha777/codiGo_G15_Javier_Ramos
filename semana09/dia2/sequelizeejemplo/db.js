const { STRING } = require('sequelize');
const Sequelize=require('sequelize');

//Para sqlite
/*
const sequelize=new Sequelize({
    dialect:'sqlite',
    storage:'./database.sqlite'
})
*/

//Para mysql
const sequelize=new Sequelize('db_sequelize','root','',{
    host:'localhost',
    dialect:'mysql'
})

sequelize.authenticate()
.then(()=>console.log('conexion establecida'))
.catch(err=>console.log("error : "+err));

//creacion de modelo
const Alumnos=sequelize.define(
    "tbl_alumno",
    {
        nombre: Sequelize.STRING,
        email:Sequelize.STRING
    }
)
module.exports={sequelize,Alumnos};
/*
sequelize.sync()
.then(()=>{
    console.log("tablas migradas");
    Alumnos.bulkCreate(
        [
            {nombre:'Javier Ramos', email:"jramos@gmail.com"},
            {nombre:'Claudia Perez',email:'claudiagonzales@hotmail.com'}
        ]
    ).then(()=>{
        return Alumnos.findAll();
    }).then((alumnos)=>console.log(alumnos));
})
*/