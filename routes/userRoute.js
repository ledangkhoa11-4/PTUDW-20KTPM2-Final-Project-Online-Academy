import express from 'express'
import middleware from '../middlewares/middleware.js';
import userService from '../services/user-service.js';
import coursesService from '../services/courses-service.js';
import bcrypt from 'bcrypt'


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

Router.post('/change-name', async(req,res,next) => {
    const newName = req.body.name;
    const resultChange = await userService.changeName(res.locals.auth.IDUser, newName);
    req.cookies.user.FullName = newName;
    if(req.session.passport) req.session.passport.user = newName;
    res.cookie("user", req.cookies.user);
    return res.render('vwUser/account',{
        layout: 'test',
        isAlert: true,
        icon: 'success',
        title: 'Name changed successfully.',
    })
})

Router.post('/change-email',async (req, res, next)=>{
    const newEmail = req.body.email;
    const resultChange = await userService.changeEmail(res.locals.auth.IDUser,newEmail);
    req.cookies.user.Email = newEmail;
    if(req.session.passport) req.session.passport.user.Email = newEmail;
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
  }),
  Router.get('/my-learning',async (req,res)=>{
    const listID = await coursesService.getCoursesByStudent(res.locals.auth.IDUser);
    let listCourse = [];
    for(let i = 0; i< listID.length;i++){
        const info = await coursesService.getInfoCourse(listID[i].ID);
        info.finish = listID[i].finish;
        listCourse.push(info);

    }
    res.render('vwUser/my-learning',{layout: 'test', listCourse})
})

Router.get('/my-watchlist',async (req,res)=>{
    const listCourse = await coursesService.getCoursesWatchlistByStudent(res.locals.auth.IDUser);
    res.render('vwUser/my-watchlist',{layout: 'test', listCourse})
})

Router.post('/delete-watchlist', async (req,res,next) => {
    const courseID = req.body.id;
    const resultChange = coursesService.removeWatchList(res.locals.auth.IDUser,courseID)
    return res.redirect('/user/my-watchlist');
})

export default Router;