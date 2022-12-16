import facebookStrategy from "passport-facebook";
import localStrategy from 'passport-local';
import userService from "../services/user-service.js";
import bcrypt from 'bcrypt'

const FacebookStrategy = facebookStrategy.Strategy;
const LocalStrategy = localStrategy.Strategy;
export default function (passport, strategy){
  passport.serializeUser(function(user, done) {
    done(null, user);
  });
  
  passport.deserializeUser(function(user, done) {
    done(null, user);
  });
  
  // Sử dụng FacebookStrategy cùng Passport.
  passport.use(new FacebookStrategy({
    clientID: process.env.facebook_key,
    clientSecret: process.env.facebook_secret,
    callbackURL: process.env.callback_url,
    profileFields: ['id','displayName','email']
    },
    function(accessToken, refreshToken, profile, done) {
      let email = profile.emails[0].value;
      let id = profile._json.id;
      let name = profile._json.name;
      const userDat = {
        FullName: name,
        Email: email,
        Password: "",
        Role: 2,
        OTP: 0,
        IDSocial: id
      }
      process.nextTick(async function () {
        const user = await userService.getUserByEmail(email);
        
        // user chưa tồn tại -> Tạo user mới
        if(user.length == 0){
          const result = await userService.addUser(userDat)}

        return done(null, userDat);
      });
    }
  ));

  passport.use(new LocalStrategy({
    usernameField: "email",
    passwordField: "password",
    passReqToCallback: true
  }, async (req, email, password, done)=>{
    let user = await userService.getUserByEmail(email);
    if (user.length == 0)
      return done(null, false);
    const hashedPassword = user[0].Password;
    const verify = await bcrypt.compare(password, hashedPassword);
    if(verify)
      return done(null, user[0])
    return done(null, false)
  }))
}
// Passport session setup. 

