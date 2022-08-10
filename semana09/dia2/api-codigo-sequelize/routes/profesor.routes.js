const express=require('express');
const boom=require('@hapi/boom');
const ProfesorService=require('../services/profesor.service');

function profesorApi(app){
    const router=express.Router();
    app.use('/profesor',router);

    const objProfesorService=new ProfesorService();

    router.get('/',async function(req,res){
        try{
            const profesor=await objProfesorService.getAll();
            res.status(200).json({
                status:true,
                content:profesor
            })
        }catch(err){
            console.log(err);
        }
    })

    router.post('/',async function(req,res){
        try{
            const body=req.body;
            const nuevoProfesor=await objProfesorService.create(body);
            res.status(201).json({
                status:true,
                content:nuevoProfesor
            })
        }catch(err){
            console.log(err);
        }
    })

    router.get('/:id',async (req,res)=>{
        try{
            const {id}=req.params;
            const profesor=await objProfesorService.findOne(id);
            res.json(profesor);
        }catch(err){
            res.status(500).json(boom.badData('error en la consulta'));
        }
    })

    router.put('/:id',async (req,res)=>{
        try{
            const {id}=req.params;
            const body=req.body;
            const profesor=await objProfesorService.update(id,body);
            res.json(profesor);
        }catch(error){
            res.status(500).json(boom.badData('error en la consulta'));
        }
    })

    router.delete('/:id',async (req,res)=>{
        try{
            const {id}=req.params;
            const profesor=await objProfesorService.delete(id);
            if(profesor){
                res.json({
                    status:true,
                    content:'profesor eliminado'
                });
            }
        }catch(err){
            res.status(500).json(boom.badData('error en la consulta'));
        }
    })
}

module.exports=profesorApi;