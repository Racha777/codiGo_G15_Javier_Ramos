const {Router}=require('express');
const router=Router();

const {getAll,getById}=require('../controllers/curso.controllers');

router.route('/')
    .get(getAll)

router.route('/:id')
    .get(getById)

module.exports=router;