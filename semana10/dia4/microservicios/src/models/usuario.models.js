const db = require('../lib/mysql.lib');
const bcrypt = require('bcryptjs');

const UsuarioModel = {}

UsuarioModel.create = async (usuario,result) =>{
    const hash = await bcrypt.hash(usuario.password,10);

    const sql = `insert into tbl_usuario(usuario_nombre,usuario_password)
                values (?,?)`;
    
    db.query(sql,[usuario.usuario,hash],(err,res)=>{
        if(err){
            console.log('error : ',err);
            result(err,null);
        }
        else{
            console.log('id usuario : ',res.insertId);
            result(null,res.insertId);
        }
    })
}

UsuarioModel.findAll= (result)=>{
    const sql=`select usuario_id,usuario_nombre from tbl_usuario`;

    db.query(sql,(err,data)=>{
        if(err){
            console.log('Error : ',err);
            result(err,null);
        }
        else{
            result(null,data);
        }
    })
}

module.exports = UsuarioModel;