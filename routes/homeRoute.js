import express from 'express'
import fn from '../services/courses-service.js'
import categoryServices from '../services/category.services.js';
const Router = express.Router();
Router.get('/',async (req,res, next)=>{

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
    res.render('home',{
        topViewer,listNewest
    });

})

export default Router;