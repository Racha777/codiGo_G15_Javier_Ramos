const mongoose=require('mongoose');
const Schema=mongoose.Schema;

const TareaSchema=new Schema({
    nombre:{
        type:String,
        minlength:2,
        maxlength:20,
        required:true
    },
    estado:{
        type:String,
        required:true,
        default: 'pendiente',
        enum:['pendiente','terminado']
    }
},
{
    timestamps:true,
    versionKey:false
})

module.exports=mongoose.model('tareas',TareaSchema);