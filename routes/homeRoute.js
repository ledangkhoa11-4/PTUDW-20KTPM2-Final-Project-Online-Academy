import express from 'express'
import fn from '../services/courses-service.js'
import categoryServices from '../services/category.services.js';
const Router = express.Router();
Router.get('/',async (req,res, next)=>{
    const listPopular = await fn.getPopular(4);
    let popular = [];
    for(let i = 0; i< listPopular.length; i++){
        const info = await fn.getInfoCourse(listPopular[i].ID);
        popular.push(info);
    }

    const listTopView = await fn.getTopView(10);
    let topViewer = [];
    for(let i = 0; i< listTopView.length; i++){
        const info = await fn.getInfoCourse(listTopView[i].ID);
        topViewer.push(info);
    }

    const idListNewest = await fn.getTopView(10);
    let listNewest = [];
    for(let i = 0; i< idListNewest.length; i++){
        const info = await fn.getInfoCourse(idListNewest[i].ID);
        listNewest.push(info);
    }

    const topCateList = await categoryServices.getMostTopicLearned(4);
    res.render('home',{
        popular,topViewer,listNewest,topCateList
    });

})

export default Router;