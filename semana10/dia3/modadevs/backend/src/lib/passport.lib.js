const {config} = require('../config');

const passport = require('passport');
const GoogleStrategy = require('passport-google-oauth').OAuth2Strategy;

passport.serializeUser(function(user, done) {
    done(null, user);
  });
  
passport.deserializeUser(function(user, done) {
    done(null, user);
});

passport.use(new GoogleStrategy({
    clientID:config.google.clientId,
    clientSecret:config.google.clientSecret,
    callbackURL:"http://localhost:5000/auth/callback"
},function(accessToken,refresToken,profile,done){
    console.log(profile);
    return done(null,profile);
}))

passport.initialize();
passport.session();

module.exports = passport;