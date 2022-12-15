import express from 'express'
import coursesService from '../services/courses-service.js';
import categoryServices from '../services/category.services.js';
const Router = express.Router();

Router.get('/categories',async (req,res, next)=>{
    const catList= await coursesService.getAllCat();
    const length=catList.length;
    res.render('vwCategory/categories',
    {layout:'admin',
     catList,
    isEmpty: length===0});
})
Router.get('/categories/:id',async (req,res, next)=>{
    const catId=req.params.id||0;
    const topicList= await categoryServices.getTopicByCat(catId);
    
    res.render('vwCategory/topics',
    {layout:'admin',
    topicList,
    isEmpty: topicList.length===0
   });
})


export default Router;