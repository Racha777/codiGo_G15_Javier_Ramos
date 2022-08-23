const cursoController={}

const cursoModel=require('../models/curso.models');

cursoController.getAll=async(req,res)=>{
    const cursos=await cursoModel.find();
    res.json({
        status:true,
        content:cursos
    })
}

cursoController.getById=async(req,res)=>{
    id=req.params.id;
    const curso=await cursoModel.findById(id);
    res.json({
        status:true,
        content:curso
    })
}

module.exports=cursoController;