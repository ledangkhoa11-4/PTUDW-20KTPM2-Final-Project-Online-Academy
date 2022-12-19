import express from 'express'

const Router = express.Router();
Router.get('/create-course',async (req,res, next)=>{
    res.render('vwInstructor/create-course')
})

export default Router;