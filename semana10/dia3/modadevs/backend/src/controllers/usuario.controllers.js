const UsuarioModel = require('../models/usuario.models');

const usuarioController = {}

usuarioController.create = async (req,res)=>{
    try{
        
        const usuarioData = req.body;
        UsuarioModel.create(usuarioData,(err,dataResponse)=>{
            if(err){
                return res.status(501).json({
                    success:false,
                    message:'hubo un error al registrar el usuario',
                    content:err
                })
            }

            return res.status(201).json({
                success: true,
                message: "usuario registrado con exito",
                content:dataResponse
            })
        })
    }catch(error){
        res.status(502).json({
            success:false,
            message:'error al registrar el producto',
            content: error
        })
    }
}

module.exports = usuarioController;