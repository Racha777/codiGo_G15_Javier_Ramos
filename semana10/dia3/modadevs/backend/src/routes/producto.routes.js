const {Router} = require('express');
const router = Router();

const {getAll,create,uploadImage} = require('../controllers/producto.controllers');

router.route('/')
    .get(getAll)
    .post(create)

router.route('/upload')
    .post(uploadImage)


module.exports = router;