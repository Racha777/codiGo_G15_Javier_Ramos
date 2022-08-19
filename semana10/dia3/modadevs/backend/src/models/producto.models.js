const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const ProductoSchema = new Schema({
    productoNombre:{
        type:String,
        required:true,
        minlength:2,
        maxlength:255
    },
    productoDescripcion:{
        type:String,
        required:true,
        minlength:2
    },
    productoImagen:{
        type:String,
        required:true
    },
    productoPrecio:{
        type:Number,
        required:true
    }
},{
    timestamps:false,
    versionKey:false
})

module.exports = mongoose.model('productos',ProductoSchema);