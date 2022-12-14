import express from 'express'
import fn from '../services/courses-service.js'
const Router = express.Router();
Router.get('/',async (req,res, next)=>{
    const idList = await fn.getTopView(10);
    let topViewer = [];
    for(let i = 0; i< idList.length; i++){
        const info = await fn.getInfoCourse(idList[i].ID);
        topViewer.push(info);
    }
    res.render('home',{
        topViewer,
    });

})

export default Router;