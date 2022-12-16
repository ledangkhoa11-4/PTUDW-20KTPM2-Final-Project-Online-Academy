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
    let isAlert = false;
    if(req.query.alert)
      isAlert = true;
    res.render('vwCategory/editCategory',{layout:'admin',category, isAlert,
    title:'This category cannot be deleted',
    icon:'error'});
})
Router.post('/categories/patch', async (req,res)=>{
    const ret=await categoryServices.patch(req.body);
    res.redirect('/admin/categories');
})
Router.post('/categories/del', async (req,res)=>{
    const catId=req.body.IDCate;
    var  isAlert=await categoryServices.isCatexistCourses(catId);
    if (isAlert){
        res.redirect(`/admin/categories/edit?id=${catId}&alert=1`);
    }
    else{
        const ret=await categoryServices.del(catId);
        res.redirect('/admin/categories');
    }
   
    
})
Router.get('/categories/topic',async (req,res, next)=>{
    const catId=req.query.id||0;
    const topicList= await categoryServices.getTopicByCat(catId);
    if(topicList===null){
        res.redirect('/admin/categories');
    }
    else{
        res.render('vwCategory/topics',
        {layout:'admin',
        topicList,
        catId,
        isEmpty: topicList.length===0
       });
    }
   
})

Router.get('/categories/topic/add', async (req,res)=>{
    const catId=req.query.catid||0;
    
    res.render('vwCategory/addTopic',{layout:'admin',catId});
})
Router.post('/categories/topic/add', async (req,res)=>{
    const catID=req.body.IDCate;
    const ret=await categoryServices.addtopic(req.body);
    res.redirect(`/admin/categories/topic?id=${catID}`);
})
Router.get('/categories/topic/edit', async(req,res)=>{
    const catId= req.query.catid||0;
    const topicId=req.query.id||0;
    const topic = await categoryServices.findTopic(topicId,catId);
    let isAlert=false;
    if(req.query.alert){
        isAlert=true;
    }
    if(topic===null){
        res.redirect(`/admin/categories/topic?id=${catID}`);
    }
    res.render('vwCategory/editTopic',
    {layout: 'admin',
     topic:topic,
     isAlert,
     title:'This topic cannot be deleted',
     icon:'error'
    })
})
Router.post('/categories/topic/patch', async(req,res)=>{
    const catID=req.body.IDCate;
    const ret = await categoryServices.patchTopic(req.body);
    res.redirect(`/admin/categories/${catID}`);
})
Router.post('/categories/topic/del', async(req,res)=>{
    const catId=req.body.IDCate||0;
    const topicId=req.body.IDTopic||0;
    const isAlert=await categoryServices.isTopicexistCourses(catId,topicId);
    if(isAlert){
        res.redirect(`/admin/categories/topic/edit?id=${topicId}&catid=${catId}&alert=1`);
    }
    else
    {
    const ret=await categoryServices.delTopic(catId,topicId);
    res.redirect(`/admin/categories/topic?id=${catId}`);
    }
})


export default Router;