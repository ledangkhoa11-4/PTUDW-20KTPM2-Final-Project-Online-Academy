import express from 'express'

const Router = express.Router();
Router.get('/register',(req,res, next)=>{
    res.render('vwAuth/register');
})
Router.get('/login',(req,res, next)=>{
    res.render('vwAuth/login');
})
export default Router;