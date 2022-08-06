const express=require('express');
const CursoService=require('../services/curso.service');

const validatorHandler=require('../middlewares/validator.handler');
const {createCursoSchema,updateCursoSchema}=require('../schemas/curso.schema');

function cursoApi(app){
    const router=express.Router();
    app.use('/curso',router);
    const objCursoService=new CursoService();

    router.get('/',async function(req,res){
        try{
            const cursos=await objCursoService.getAll();
            res.status(200).json({
                status:true,
                content:cursos
            })
        }catch(err){
            console.log(err);
        }
    })

    router.post('/',validatorHandler(createCursoSchema,'body'),async function(req,res){
        const {body:curso}=req;
        console.log(curso);
        try{
            const crearCurso=await objCursoService.create({curso});
            res.status(201).json({
                status:true,
                content:crearCurso
            })
        }catch(err){
            console.log(err);
        }
    })

    router.get('/:id',async function(req,res){
        const {id}=req.params;
        try{
            const curso=await objCursoService.getById(id);
            if(curso.length>0){
                res.status(200).json({
                    status:true,
                    content:curso[0]
                })
            }else{
                res.status(204).json({
                    status:false,
                    content:'no hay registros'
                })
            }
        }catch(err){
            console.log(err);
        }
    })

    router.put('/:id',validatorHandler(updateCursoSchema,'body'),async function(req,res){
        const {id}=req.params;
        const {body:data}=req;

        try{
            const curso=await objCursoService.update({data,id});
            if(curso.length>0){
                res.status(200).json({
                    status:true,
                    content:curso[0]
                })
            }else{
                res.status(204).json({
                    status:false,
                    content:'no se encontraron registros'
                })
            }
        }catch(err){
            console.log(err);
        }
    })

    router.delete('/:id',async function(req,res){
        const {id}=req.params;

        try{
            const curso=await objCursoService.delete(id);
            if(curso){
                res.status(200).json({
                    status:true,
                    content:'curso eliminado'
                })
            }else{
                res.status(204).json({
                    status:false,
                    content:'no se encontraron registros'
                })
            }
        }catch(err){
            console.log(err);
        }
    })

}

module.exports=cursoApi;