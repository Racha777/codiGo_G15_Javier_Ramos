const mysql=require('mysql');

const mysqlConnection=mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'',
    database:'db_codigo',
})

mysqlConnection.connect(function(err){
    if(err){
        console.error(err);
        return;
    }
    else{
        console.log('conexion a bd exitosa');
    }
});

module.exports=mysqlConnection;

/*connection.query('select count(*) as total from tbl_alumno',function(error,results,fields){
    if(error) throw error;
    console.log('la solucion es', results[0].total);
})

connection.end();*/