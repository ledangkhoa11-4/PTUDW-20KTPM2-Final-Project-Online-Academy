import express from 'express'
import userService from '../services/user-service.js'
import bcrypt from 'bcrypt'
import nodemailer from 'nodemailer';
import passport from 'passport';


var transporter = nodemailer.createTransport({
    host: 'smtp.gmail.com',
    port: 465,
    secure: true,
    auth: {
      user: 'udemall.ktpm1@gmail.com',
      pass: 'nlwbxlevmbkeryui'
    }
  });

const Router = express.Router();
Router.get('/register',async (req,res, next)=>{
    res.render('vwAuth/register');  
})
Router.get('/login',(req,res, next)=>{
    let isAlert = req.query.error;
    let alertTitle = {isAlert: false,};
    if(isAlert == 1){
      alertTitle = {
        isAlert: true,
        msg: "Username or Password incorrect. Please type again!"
      }
    }
    if(isAlert == 2){
      alertTitle = {
        isAlert: true,
        msg: "Your account was suspended. Please contact to admin!"
      }
    }
    res.render('vwAuth/login',{
      alertTitle
    });
})
Router.get('/logout',(req,res, next)=>{
  res.clearCookie("user");
  req.logout(function(err) {
    if (err) { return next(err); }
    res.redirect('/');
  });
})

Router.post("/login",async (req, res, next)=>{
  const user = req.body;
  
  let userCheck = await userService.getUserByEmail(user.email);
  if (userCheck.length == 0)
      return res.redirect("/auth/login?error=1")
  const hashedPassword = userCheck[0].Password;
  const checkPsw = await bcrypt.compare(user.password, hashedPassword);
  if(!checkPsw)
    return res.redirect("/auth/login?error=1")
  if(user.otp){
    const otp = user.otp[0] + user.otp[1] + user.otp[2] + user.otp[3];
    await userService.verified(user.email, otp);
  }
  const verified = await userService.isVerified(user.email);
  res.locals.admin=userCheck[0];
  if(verified)
    return next();
  res.locals.temp = user;
  res.render('vwAuth/inputOtp',{
    email: user.email,
    password: user.password
  })
}, passport.authenticate('local',{ failureRedirect: '/auth/login?error=1'}), (req,res)=>{
  if(req.session.passport.user.status == "disabled"){
    return res.redirect('/auth/login?error=2');
  }
 if(res.locals.admin.Role===0){
    res.redirect("/admin/categories")
 }
 else{
  res.redirect("/");
 }
});


Router.post('/register',async (req,res, next)=>{
    const user = req.body;
    const OTP =  Math.floor(Math.random() * (9999 - 1000 + 1)) + 1000;
    const hashedPassword = await bcrypt.hash(user.password, 5);
    const result = await userService.addUser({
        FullName: user.name,
        Email: user.email,
        Password: hashedPassword,
        Role: 2,
        OTP: OTP
    })
    var mailOptions = {
      from: 'onlineAcademyKTPM1@gmail.com',
      to: user.email,
      subject: 'Shh, don\'t share this OTP with anyone' ,
      html: `
      <div style="font-family: Helvetica,Arial,sans-serif;min-width:1000px;overflow:auto;line-height:2">
    <div style="margin:50px auto;width:70%;padding:20px 0">
    <div style="border-bottom:1px solid #eee">
      <a href="" style="font-size:1.4em;color: #00466a;text-decoration:none;font-weight:600">AcadeMall</a>
    </div>
    <p style="font-size:1.1em">Hi, ${user.name}</p>
    <p>Thank you for choosing AcadeMall. Use the following OTP to complete your Sign Up procedures. If you cannot see mail in your inbox, please check junk box, it may be in here. Sorry for the inconvenience</p>
    <h2 style="background: #00466a;margin: 0 auto;width: max-content;padding: 0 10px;color: #fff;border-radius: 4px;">${OTP}</h2>
    <p style="font-size:0.9em;">Regards,<br />AcadeMall</p>
    <hr style="border:none;border-top:1px solid #eee" />
    <div style="float:right;padding:8px 0;color:#aaa;font-size:0.8em;line-height:1;font-weight:300">
      <p>AcadeMall Inc</p>
      <p>227 Nguyen Van Cu Ho Chi Minh City</p>
      <p>Viet Nam</p>
    </div>
  </div>
</div>
      `
    };
    transporter.sendMail(mailOptions, function(error, info){
      if (error) {
        console.log(error);
      }
    });

    res.render('vwAuth/register',{
        isAlert : true,
        icon: 'success',
        title: 'Check your email to validation'
    });
})

Router.get('/facebook', passport.authenticate('facebook',{scope:'email'}));
Router.get('/google', passport.authenticate('google',{scope:['profile','email']}));

Router.get('/facebook/callback',
  passport.authenticate('facebook', { successRedirect : '/', failureRedirect: '/login' }),
  function(req, res) {
    res.redirect('/');
  });

Router.get('/google/callback',
  passport.authenticate('google', { successRedirect : '/', failureRedirect: '/login' }),
  function(req, res) {
    res.redirect('/');
  });


Router.post('/check-valid-pass', async (req, res)=>{
    const password = req.body.password;
    const user = await userService.findUserById(res.locals.auth.IDUser);
    let isValid = await bcrypt.compare(password, user.Password);
    res.json({isValid});
  });
Router.post('/check-exists-email', async (req, res)=>{
  const email = req.body.email;
  let exists = await userService.isEmailExists(email); 
  res.json({exists});
});
Router.post('/check-current-name', async (req, res) =>{
  const name = req.body.name;
  let exists = await userService.isNameExists(req.body.id, name);
  res.json({exists});
})
export default Router;