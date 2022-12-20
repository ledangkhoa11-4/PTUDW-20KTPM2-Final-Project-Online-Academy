import express from 'express'

const Router = express.Router();
Router.get('/create-course',async (req,res, next)=>{
    res.render('vwInstructor/create-course')
})
Router.post('/create-course',async (req,res, next)=>{
    res.json(req.body)
})
export default Router;