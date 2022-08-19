const productoController = {};

const cloudinary = require('cloudinary').v2

const {config} = require('../config');

cloudinary.config({ 
    cloud_name: config.cloudinary.cloud_name, 
    api_key: config.cloudinary.api_key, 
    api_secret: config.cloudinary.api_secret
  });

const productoModel = require('../models/producto.models');

productoController.getAll = async (req,res)=>{
    const productos = await productoModel.find();
    res.json({
        success: true,
        message: "Los productos se han cargado correctamente",
        content:productos
    })
}

productoController.create = async (req,res)=>{
    try{
        //console.log("archivo : " + req.file);
        /*cloudinary.v2.uploader.upload(req.files.productoImagen2, {upload_preset: "my_preset"}, (error, result)=>{
            console.log(result, error);
          });
          */
        const nuevoProducto = new productoModel(req.body)
        await nuevoProducto.save();
        res.json({
            success: true,
            message: "producto registrado con exito",
            content:nuevoProducto
        })
    }catch(error){
        res.status(502).json({
            success:false,
            message:'error al registrar el producto',
            content: error
        })
    }
}

productoController.uploadImage = async (req,res)=>{
    
    
    productoImagen = req.files.productoImagen
    console.log(productoImagen.name);

    let uploadPath;
    uploadPath = '../backend/src/uploads/' + productoImagen.name;

    await productoImagen.mv(uploadPath,function(err){
        if(err){
            res.status(502).json({
                success: false,
                message: "no se pudo subir la imagen",
                content: err
            })
        }
        else{
            cloudinary.uploader.upload(uploadPath,(error, result)=>{
                console.log(result, error);
                res.json({
                    success: true,
                    message: "producto e imagen registrado con exito",
                    content: result.url
                })
            });
            
        }
    }) 
}

module.exports = productoController;