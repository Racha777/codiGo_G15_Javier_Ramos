const mongoose=require('mongoose');
const Schema=mongoose.Schema;

const UsuarioSchema=new Schema({
    nombre:{
        type:String,
        minlength:2,
        maxlength:20,
        required:true,
        unique:true
    },
    password:{
        type:String,
        required:true,
    }
},
{
    timestamps:false,
    versionKey:false
})

module.exports=mongoose.model('usuario',UsuarioSchema);