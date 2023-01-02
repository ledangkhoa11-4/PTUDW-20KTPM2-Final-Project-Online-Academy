import express from 'express'
import middleware from '../middlewares/middleware.js';
import userService from '../services/user-service.js';



const Router = express.Router();

Router.use(middleware.isStudent);
Router.get('/',(req,res,next) =>{
    res.render('vwUser/nothing',{

    })
});

Router.get('/profile', async (req,res,next) =>{
    const infos = await userService.getInfo(res.locals.auth.IDUser || 0);
    res.render('vwUser/nothing',{layout: 'test', infos
        
    })
})

Router.get('/account', async (req,res,next) =>{
    const infos = await userService.getInfo(res.locals.auth.IDUser || 0);
    res.render('vwUser/account',{
        layout: 'test'
    })
})

Router.post('/change-email',async (req, res, next)=>{
    const newEmail = req.body.email;
    if(newEmail == res.locals.auth.Email)
         return res.render('vwUser/account',{
             layout: 'test', 
             isAlert: true,
             icon: 'info',
             title: 'You have entered your current Email!',
         })
    const isExists = await userService.isEmailExists(newEmail);
    if(isExists)
         return res.render('vwUser/account',{
             layout: 'test', 
             isAlert: true,
             icon: 'error',
             title: 'Email already exists!',
         })
     const resultChange = await userService.changeEmail(res.locals.auth.IDUser,newEmail);
     req.cookies.user.Email = newEmail
     res.cookie("user", req.cookies.user);
     return res.render('vwUser/account',{
         layout: 'test', 
         isAlert: true,
         icon: 'success',
         title: 'Email changed successfully.',
     })
 })

 Router.post('/change-password',async (req, res, next)=>{
     const password = req.body.password;
     const hashedPassword = await bcrypt.hash(password,5);
     const resultChange = await userService.changePassword(res.locals.auth.IDUser, hashedPassword);
     return res.render('vwUser/account',{
         layout: 'test', 
         isAlert: true,
         icon: 'success',
         title: 'Password changed successfully.',
     })
  })

export default Router;