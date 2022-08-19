const mysql = require('mysql');
const {config} = require('../config');


const db = mysql.createConnection({
    host:config.mysql.host,
    user:config.mysql.user,
    password:config.mysql.pwd,
    database:config.mysql.db
});

db.connect(function(err){
    if (err) throw err;
    console.log('conectado a mysql');
});

module.exports = db;