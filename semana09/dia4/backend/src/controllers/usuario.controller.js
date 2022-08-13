const usuarioController={};

const usuarioModel=require('../models/usuario.model');
const boom=require('@hapi/boom');
const jwt=require('jsonwebtoken');
const bcrypt=require('bcryptjs');

usuarioController.getAll=async (req,res)=>{
    const usuarios=await usuarioModel.find();
    res.json(usuarios);
}

usuarioController.create=async (req,res)=>{
    const {nombre,password}=req.body;

    passwordEncriptado=await bcrypt.hash(password,10);
    console.log("password encriptado: "+passwordEncriptado);

    let data={
        nombre:nombre,
        password:passwordEncriptado
    }

    const nuevaUsuario=new usuarioModel(data);
    await nuevaUsuario.save();

    let dataResponse={
        id:nuevaUsuario._id,
        nombre:nuevaUsuario.nombre
    }

    res.json({
        status:true,
        content:dataResponse
    });
}

usuarioController.auth=async (req,res)=>{
    const {nombre,password}=req.body;

    const authUsuario=await usuarioModel.findOne({nombre});

    if(authUsuario && (await bcrypt.compare(password,authUsuario.password))){
        //datos de auth correctos
        const token=jwt.sign(
            {usu_id:authUsuario._id,usu_name:authUsuario.nombre},
            'qwerty123',
            {
                expiresIn:'1h'
            }
        )

        let dataResponse={
            status:true,
            content:token
        }

        res.status(200).json(dataResponse);
    }else{
        res.status(400).json({
            status:false,
            content:'nombre o password invalidos'
        })
    }
}

usuarioController.update=async (req,res)=>{
    const {id}=req.params;

    const usuarioEditado=await usuarioModel.findOneAndUpdate({_id:id},req.body,{
        returnOriginal:false
    })
    res.json({
        status:true,
        content:usuarioEditado
    });
}

usuarioController.deleteOne=async (req,res)=>{
    const {id}=req.params;

    usuarioModel.findByIdAndDelete(id,function(err,docs){
        if(err){
            console.log(err)
        }else{
            res.json({
                status:true,
                content:docs
            })
        }
    })
}

module.exports=usuarioController;