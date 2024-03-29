const express=require('express');
const AlumnoService=require('../services/alumno.service');

function alumnoApi(app){
    const router=express.Router();
    app.use('/alumno',router);
    const objAlumnoService=new AlumnoService();

    router.get('/',async function(req,res){
        try{
            const alumnos=await objAlumnoService.getAll();
            res.status(200).json({
                status:true,
                content:alumnos
            })
        }catch(err){
            console.log(err);
        }
    })

    router.post('/',async function(req,res){
        const {body:alumno}=req;
        console.log(alumno);
        try{
            const crearAlumno=await objAlumnoService.create({alumno});
            res.status(201).json({
                status:true,
                content:crearAlumno
            })
        }catch(err){
            console.log(err);
        }
    })

    router.get('/:id',async function(req,res){
        const {id}=req.params;
        try{
            const alumno=await objAlumnoService.getById(id);
            if(alumno.length>0){
                res.status(200).json({
                    status:true,
                    content:alumno[0]
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

    router.put('/:id',async function(req,res){
        const {id}=req.params;
        const {body:data}=req;

        try{
            const alumno=await objAlumnoService.update({data,id});
            if(alumno.length>0){
                res.status(200).json({
                    status:true,
                    content:alumno[0]
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
            const alumno=await objAlumnoService.delete(id);
            if(alumno){
                res.status(200).json({
                    status:true,
                    content:'alumno eliminado'
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

module.exports=alumnoApi;