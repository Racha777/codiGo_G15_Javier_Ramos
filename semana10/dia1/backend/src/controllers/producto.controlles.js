const productoController={};

const cloudinary = require('cloudinary').v2

const productoModel=require('../models/producto.models');

productoController.getAll=async (req,res)=>{
    const productos=await productoModel.find();
    res.json({
        success:true,
        message:'Los productos se han cargado correctamente',
        content:productos
    })
}

productoController.create=async (req,res)=>{
    try{
        req.files;
        const nuevoProducto=new productoModel(req.body);
        await nuevoProducto.save();
        res.json({
            status:true,
            message:"producto resgistrado con exito",
            content:nuevoProducto
        })
    }catch(error){
        res.status(502).json({
            success:false,
            message:'Error al registrar el producto',
            content:error
        })
    }
}

module.exports=productoController;