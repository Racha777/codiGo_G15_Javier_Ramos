const {Router} = require('express');
const router = Router();

const {create} = require('../controllers/usuario.controllers');

router.route('/')
    .post(create)

module.exports = router;