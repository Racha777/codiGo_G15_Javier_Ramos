const UsuarioModel=require('../models/usuario.models');

const usuarioController={};

usuarioController.create = async (req,res)=>{
    try{
        const usuarioData=req.body;
        UsuarioModel.create(usuarioData,(err,dataResponse)=>{
            if(err){
                return res.status(501).json({
                    success:false,
                    message:'Hubo un error al registrar el usuario',
                    content:err
                })
            }

            return res.status(201).json({
                success:true,
                message:'Usuario registrado con exito',
                content:dataResponse
            })
        })
    }catch(error){
        res.status(502).json({
            success:false,
            message:'error al registrar el usuario',
            content: error
        })
    }
}

usuarioController.getAll = async (req,res)=>{
    try{
        UsuarioModel.findAll((err,dataResponse)=>{
            if(err){
                return res.status(501).json({
                    success:false,
                    message:'hubo un error al retornar los usuarioa',
                    content:err
                })
            }

            return res.status(201).json({
                success:true,
                message:'listado de usuarios',
                content:dataResponse
            })
        })
    }catch(error){
        console.log(error);
        res.status(502).json({
            success:false,
            message:'error al retornar usuarios',
            content: error
        })
    }
}

module.exports=usuarioController;