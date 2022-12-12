import express from 'express'

const Router = express.Router();
Router.get('/',(req,res, next)=>{
    res.render('vwSearch/index');
})

export default Router;