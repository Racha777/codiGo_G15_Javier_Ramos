const express = require('express');
const cors = require('cors');
const {config} = require('./config');

//const passport = require('passport');
//const GoogleStrategy = require('passport-google-oidc');
//const cookieSession = require('cookie-session')
const session = require('express-session')
var passport = require('passport');
var GoogleStrategy = require('passport-google-oauth').OAuth2Strategy;

const app = express();

app.use(session({
    secret: 'somethingsecretgoeshere',
    resave: false,
    saveUninitialized: true,
    cookie: { secure: true }
}));

passport.serializeUser(function(user, done) {
    done(null, user);
  });
  
passport.deserializeUser(function(user, done) {
    done(null, user);
});


//middlewares de terceros
app.use(cors());
app.use(express.json());
app.use(express.static('public'));

app.get('/',(req,res)=>{
    res.json({
        content:'servidor passport iniciado'
    })
})

/////////// AUTH CON GOOGLE ////////////////
passport.use(new GoogleStrategy({
    clientID:config.google.clientId,
    clientSecret:config.google.clientSecret,
    callbackURL:"http://localhost:5000/callback"
},function(accessToken,refresToken,profile,done){
    console.log(profile);
    return done(null,profile);
}))

app.use(passport.initialize());
app.use(passport.session());

app.get('/callback', 
  passport.authenticate('google', { failureRedirect: '/failed' }),
  function(req, res) {
    res.send('estas logueado')
  });

app.get('/failed', (req, res) => res.send('error en login de google'))


//ruta para abrir google
app.get('/login/federated/google', passport.authenticate('google',{ scope: ['https://www.googleapis.com/auth/plus.login'] }));

app.listen(5000,function(){
    console.log('servidor en http://localhost:5000')
})