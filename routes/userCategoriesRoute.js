import express from 'express'
import coursesService from '../services/courses-service.js';

const Router = express.Router();
Router.get('/',async(req,res, next)=>{
    const id = req.query.catID;
    const page = req.query.p || 1;
    const limit = 2;
    const offset = (page - 1) * limit;

    const list = await coursesService.getCourseIDByCatPage(id,limit,offset);
    const temp = await coursesService.getCourseIDByCat(id);
    const count = temp.length;
    let nPage = Math.floor(count/limit);
    if(count % limit > 0) nPage++;
    let coursesList = [];

    for(let i = 0; i < list.length; i++){
        const info = await coursesService.getInfoCourse(list[i].ID);
        coursesList.push(info);
    }
    res.render('vwUserCategory/index',
    {coursesList,
    isEmpty: coursesList.length===0,
    nPage,page,id,nResults: count, name: coursesList[0].CatName
    }
);
})

Router.get('/:catID',async(req,res, next)=>{
    const topicID = req.query.topicID;
    const catID = req.params.catID;
    const page = req.query.p || 1;
    const limit = 2;
    const offset = (page - 1) * limit;

    const list = await coursesService.getCourseIDByTopicPage(catID,topicID,limit,offset);
    const temp = await coursesService.getCourseIDByTopic(catID,topicID);
    const count = temp.length;
    let nPage = Math.floor(count/limit);
    if(count % limit > 0) nPage++;
    let coursesList = [];

    for(let i = 0; i < list.length; i++){
        const info = await coursesService.getInfoCourse(list[i].ID);
        coursesList.push(info);
    }
    res.render('vwUserTopic/index',
    {coursesList,
    isEmpty: coursesList.length===0,
    nPage,page,topicID: topicID,catID: catID,nResults: count, name: coursesList[0].CatName
    }
    );
})


export default Router;