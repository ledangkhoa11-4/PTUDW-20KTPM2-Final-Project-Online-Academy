import express, { query, request } from 'express'
import middleware from '../middlewares/middleware.js';
import userService from '../services/user-service.js';
import coursesService from '../services/courses-service.js';
import bcrypt from 'bcrypt'


const Router = express.Router();

Router.get('/account', async (req,res,next) =>{
    const infos = await userService.getInfo(res.locals.auth.IDUser || 0);
    res.render('vwUser/account',{
        layout: 'user',infos
    })
})

Router.post('/change-name', async(req,res,next) => {
    const newName = req.body.name;
    const infos = await userService.getInfo(res.locals.auth.IDUser || 0);
    const resultChange = await userService.changeName(res.locals.auth.IDUser, newName);
    req.cookies.user.FullName = newName;
    if(req.session.passport) req.session.passport.user = req.cookies.user;
    res.cookie("user", req.cookies.user);
    return res.render('vwUser/account',{
        layout: 'user',
        isAlert: true,
        icon: 'success',
        title: 'Name changed successfully.',
        infos
    })
})

Router.post('/change-email',async (req, res, next)=>{
    const newEmail = req.body.email;
    const infos = await userService.getInfo(res.locals.auth.IDUser || 0);
    const resultChange = await userService.changeEmail(res.locals.auth.IDUser,newEmail);
    req.cookies.user.Email = newEmail;
    if(req.session.passport) req.session.passport.user.Email = newEmail;
    res.cookie("user", req.cookies.user);
    return res.render('vwUser/account',{
        layout: 'user', 
        isAlert: true,
        icon: 'success',
        title: 'Email changed successfully.',
        infos
    })
 })

 Router.post('/change-password',async (req, res, next)=>{
     const infos = await userService.getInfo(res.locals.auth.IDUser || 0);
     const password = req.body.password;
     const hashedPassword = await bcrypt.hash(password,5);
     const resultChange = await userService.changePassword(res.locals.auth.IDUser, hashedPassword);
     return res.render('vwUser/account',{
         layout: 'user', 
         isAlert: true,
         icon: 'success',
         title: 'Password changed successfully.',
         infos
     })
  }),
  Router.get('/my-learning',async (req,res)=>{
    const page = req.query.p || 1;
    const limit = 4;
    const offset = (page - 1) * limit;
    const listID = await coursesService.getCoursesByStudentByPage(res.locals.auth.IDUser,limit,offset);
    let count = await coursesService.getTotalCourseByStudentID(res.locals.auth.IDUser);
    let nPage = Math.ceil(count / limit)
    let listCourse = [];
    for(let i = 0; i< listID.length;i++){
        const info = await coursesService.getInfoCourse(listID[i].ID);
        info.finish = listID[i].finish;
        listCourse.push(info);
    }
    let url = `/user/my-learning?`
    // res.render('vwUser/my-learning',{layout: 'user', listCourse});
    res.render('vwUser/my-learning',{
        layout: 'user',
        listCourse,
        nPage,
        page,
        url,
        count,
    })
})

Router.get('/my-watchlist',async (req,res)=>{
    const page = req.query.p || 1;
    const limit = 4;
    const offset = (page - 1) * limit;
    const listID = await coursesService.getCoursesWatchlistByStudentByPage(res.locals.auth.IDUser,limit,offset);
    let count = await coursesService.getTotalCoursesByStudentIDWatchlist(res.locals.auth.IDUser);
    let nPage = Math.ceil(count / limit);
    let listCourse = [];
    for(let i = 0; i< listID.length;i++){
        const info = await coursesService.getInfoCourse(listID[i].ID);
        info.finish = listID[i].finish;
        listCourse.push(info);
    }
    let url = `/user/my-watchlist?`
    // res.render('vwUser/my-learning',{layout: 'user', listCourse});
    res.render('vwUser/my-watchlist',{
        layout: 'user',
        listCourse,
        nPage,
        page,
        url,
        count,
    })
})

Router.post('/delete-watchlist', async (req,res,next) => {
    const courseID = req.body.id;
    const resultChange = coursesService.removeWatchList(res.locals.auth.IDUser,courseID)
    return res.redirect('/user/my-watchlist');
})

export default Router;