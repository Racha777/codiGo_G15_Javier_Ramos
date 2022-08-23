const mongoose=require('mongoose');
const Schema=mongoose.Schema;

const SesionSchema=new Schema({
    nombre:{
        type:String,
        required:true
    },
    video:{
        type:String,
        required:true
    },
    duracion:{
        type:Number,
        required:true
    }
})

const ModuloSchema=new Schema({
    nombre:{
        type:String,
        required:true
    },
    sesiones:[SesionSchema]
})

const CursoSchema=new Schema({
    id:{
        type:Number,
        required:true,
        unique:true
    },
    titulo:{
        type:String,
        required:true,
        minlength:2
    },
    instructor:{
        type:String,
        required:true,
        minlegth:2
    },
    video:{
        type:String,
        required:true,
        minlegth:2
    },
    modulos:[ModuloSchema]
},{
    timestamps:false,
    versionkey:false
})

module.exports=mongoose.model('cursos',CursoSchema);