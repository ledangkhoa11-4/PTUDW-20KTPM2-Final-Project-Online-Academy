import express from 'express'
import userService from '../services/user-service.js'
import bcrypt from 'bcrypt'
import nodemailer from 'nodemailer';



var transporter = nodemailer.createTransport({
    host: 'smtp.gmail.com',
    port: 465,
    secure: true,
    auth: {
      user: 'onlineacademyktpm1@gmail.com',
      pass: 'zohreguhsrvxwwce'
    }
  });

const Router = express.Router();
Router.get('/register',async (req,res, next)=>{

    res.render('vwAuth/register');  
    
})
Router.get('/login',(req,res, next)=>{
    res.render('vwAuth/login');
})
Router.post('/register',async (req,res, next)=>{
    const user = req.body;
    let isEmailExists = await userService.isEmailExists(user.email); 
    if(isEmailExists){
        res.render('vwAuth/register',{
            isAlert : true,
            icon: 'error',
            title: 'Your email is already exists'
        });
        return;
    }
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
    <p>Thank you for choosing AcadeMall. Use the following OTP to complete your Sign Up procedures.</p>
    <h2 style="background: #00466a;margin: 0 auto;width: max-content;padding: 0 10px;color: #fff;border-radius: 4px;">${OTP}</h2>
    <p style="font-size:0.9em;">Regards,<br />Your Brand</p>
    <hr style="border:none;border-top:1px solid #eee" />
    <div style="float:right;padding:8px 0;color:#aaa;font-size:0.8em;line-height:1;font-weight:300">
      <p>Your Brand Inc</p>
      <p>1600 Amphitheatre Parkway</p>
      <p>California</p>
    </div>
  </div>
</div>
      `
    };
    
    transporter.sendMail(mailOptions, function(error, info){
      if (error) {
        console.log(error);
      } else {
        console.log('Email sent: ' + info.response);
      }
    });

    res.render('vwAuth/register',{
        isAlert : true,
        icon: 'success',
        title: 'Check your email to validation'
    });
})
export default Router;