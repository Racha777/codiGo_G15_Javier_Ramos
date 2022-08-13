const {Router}=require('express');
const router=Router();

const {getAll,create,update,deleteOne,auth}=require('../controllers/usuario.controller');

router.route('/')
    .get(getAll)
    .post(create)

router.route('/:id')
    .put(update)//.patch para registros con muchos atributos
    .delete(deleteOne)

router.route('/auth')
    .post(auth)

module.exports=router;