const {Router} = require('express');
const router = Router();

const {create} = require('../controllers/usuario.controllers');
const passport = require('../lib/passport.lib');

router.route('/callback')
   .get( 
    passport.authenticate('google', { failureRedirect: '/failed' }),
    function(req, res) {
      res.json({
        status:true,
        content:'estas logueado'
      })
    })

router.route('/failed')
    .get((req, res) => res.status(401).json({
        status:true,
        content:'no se puedo loguear con google'
      }))

router.route('/google')
    .get(passport.authenticate('google',{ scope: ['https://www.googleapis.com/auth/plus.login'] }))

module.exports = router;