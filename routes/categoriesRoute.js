import express from 'express'
import coursesService from '../services/courses-service.js';
import categoryServices from '../services/category.services.js';
const Router = express.Router();

Router.get('/categories',async (req,res, next)=>{
    const catList= await categoryServices.getAllCat();
    const length=catList.length;
    res.render('vwCategory/categories',
    {layout:'admin',
     catList,
    isEmpty: length===0});
})
Router.get('/categories/add', async (req,res)=>{
    res.render('vwCategory/addCategory',{layout:'admin'});
})
Router.post('/categories/add', async (req,res)=>{
    const ret=await categoryServices.add(req.body);
    res.redirect('/admin/categories');
})
Router.get('/categories/edit', async (req,res)=>{
    const catId=req.query.id||0;

    const category= await categoryServices.findById(catId);
  
    if (category === null) {
        return res.redirect('/admin/categories');
      }
    res.render('vwCategory/editCategory',{layout:'admin',category});
})
Router.post('/categories/patch', async (req,res)=>{
    const ret=await categoryServices.patch(req.body);
    res.redirect('/admin/categories');
})
Router.post('/categories/del', async (req,res)=>{
    const catId=req.body.IDCate;
    const ret=await categoryServices.del(catId);
    res.redirect('/admin/categories');
})
Router.get('/categories/:id',async (req,res, next)=>{
    const catId=req.params.id||0;
    const topicList= await categoryServices.getTopicByCat(catId);
    res.render('vwCategory/topics',
    {layout:'admin',
    topicList,
    catId: topicList[0].IDCate,
    isEmpty: topicList.length===0
   });
})

Router.get('/categories/topic/add', async (req,res)=>{
    const catId=req.query.catid||0;
    
    res.render('vwCategory/addTopic',{layout:'admin',catId});
})
Router.post('/categories/topic/add', async (req,res)=>{
    console.log(req.body);
    const ret=await categoryServices.addtopic(req.body);
    res.redirect('/admin/categories');
})
Router.get('/categories/topic/edit', async (req,res)=>{
    const catId=req.query.catid||0;
    const topicId=req.query.id||0;
    const topic= await categoryServices.findTopic(topicId,catId);
  
    
    res.render('vwCategory/editTopic',{layout:'admin',topic});
})




export default Router;