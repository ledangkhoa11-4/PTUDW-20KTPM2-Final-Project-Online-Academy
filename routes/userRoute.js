import express from 'express'
import middleware from '../middlewares/middleware.js';





const Router = express.Router();

Router.use(middleware.isInstructor);
Router.get('/',(req,res,next) =>{
    res.render('vwUser/nothing',{

    })
});

Router.get('/profile',(req,res,next) =>{
    const info = 
    res.render('vwUser/nothing',{

    })
})

export default Router;