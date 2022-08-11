const express = require('express');
const AlumnoService = require('../services/alumno.service');

const boom = require('@hapi/boom');

const validatorHandler = require('../middlewares/validator.handler');
const {verifyToken} = require('../middlewares/auth.handler');
const {createAlumnoSchema,updateAlumnoSchema} = require('../schemas/alumno.schema');

function alumnoApi(app){
    const router = express.Router();
    app.use('/alumno',router);

    const objAlumnoService = new AlumnoService();

    router.get('/',async function(req,res){
        try{
            const alumnos = await objAlumnoService.getAll();
            res.status(200).json({
                status:true,
                content:alumnos
            })
        }catch(err){
            console.log(err)
        }
    })


    router.post("/",
    validatorHandler(createAlumnoSchema,'body')
    ,async function(req,res){
        const {body : alumno} = req;
        console.log(alumno);
        try{
            const crearAlumno = await objAlumnoService.create(alumno);
            res.status(201).json({
                status:true,
                content:crearAlumno
            })
        }catch(err){
            console.log(err);
        }
    })

    router.get("/:id",async function(req,res){
        const {id} = req.params;
        try{
            const alumno = await objAlumnoService.getById(id);
            res.json(alumno);
            
        }catch(err){
            res.status(500).json(boom.badData('error en la consulta'))
        }
    })

    router.put('/:id',async function(req,res){
        try{
            const {id} = req.params;
            const body = req.body;
            const alumno = await objAlumnoService.update(id,body);
            res.json(alumno);
        }catch(err){
            res.status(500).json(boom.badData('error en la consulta'))
        }
    })

    router.delete('/:id',async function(req,res){
        const {id} = req.params;

        try{
            const alumno = await objAlumnoService.delete(id);
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
            res.status(500).json(boom.badData('error en la consulta'))
        }
    })
}

module.exports = alumnoApi;