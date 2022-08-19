const {Router} = require('express');
const router = Router();

const {create,getAll} = require('../controllers/usuario.controllers');

router.route('/')
    .get(getAll)
    .post(create)

module.exports = router;