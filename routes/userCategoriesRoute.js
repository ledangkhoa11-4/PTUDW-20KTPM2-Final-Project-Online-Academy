import express from "express";
import categoryServices from "../services/category.services.js";
import coursesService from "../services/courses-service.js";

const Router = express.Router();

Router.use( async(req, res, next)=>{
  const allCats = await categoryServices.getAllCat();
  let topics = [];
  for(let i = 0; i< allCats.length;i++){
    const topic = await categoryServices.getTopicByCat(allCats[i].IDCate);
    topics.push(topic)
  }
  res.locals.allCats = allCats;
  res.locals.allTopics = topics;
  next();
})
Router.get("/", async (req, res, next) => {
  const id = req.query.catID || 1;
  const page = req.query.p || 1;
  const limit = 2;
  const offset = (page - 1) * limit;

  const list = await coursesService.getCourseIDByCatPage(id, limit, offset);
  // const temp = await coursesService.getCourseIDByCat(id);
  const count = await coursesService.getTotalCourseByCatIdDisable(id);
  const name = await coursesService.getCourseNameByCat(id);
  // const count = temp.length;
  let nPage = Math.ceil(count / limit);
  let coursesList = [];

  for (let i = 0; i < list.length; i++) {
    const info = await coursesService.getInfoCourse(list[i].ID);
    coursesList.push(info);
  }
  let catNum = res.locals.allCats.length;
  
  for (let i = 0; i < catNum; i++) {

    if(res.locals.allCats[i].IDCate == id){
      res.locals.allCats[i].active = true;
      break;
    }
  }
  let url = `/categories?catID=${id}`
  res.render("vwUserCategory/index", {
    coursesList,
    isEmpty: coursesList.length === 0,
    nPage,
    page,
    id,nResults: count, name,
    url,
  });
});

Router.get("/:catID", async (req, res, next) => {
  const topicID = req.query.topicID;
  const catID = req.params.catID;
  const page = req.query.p || 1;
  const limit = 2;
  const offset = (page - 1) * limit;

  const list = await coursesService.getCourseIDByTopicPage(
    catID,
    topicID,
    limit,
    offset
  );
  console.log(list);
  // const temp = await coursesService.getCourseIDByTopic(catID, topicID);
  const count = await coursesService.getTotalCourseByTopicIDDisable(catID,topicID);
  console.log(count);
  let name = await coursesService.getCourseNameByCat(catID);
  // const count = temp.length;
  let nPage = Math.ceil(count / limit);
  let coursesList = [];

  for (let i = 0; i < list.length; i++) {
    const info = await coursesService.getInfoCourse(list[i].ID);
    coursesList.push(info);
  }
  let catNum = res.locals.allCats.length;
  for (let i = 0; i < catNum; i++) {
    if(res.locals.allCats[i].IDCate == catID){
      res.locals.allCats[i].active = true;
      let topicNum = res.locals.allTopics[i].length;
      for(let j = 0; j < topicNum; j++){
        if(res.locals.allTopics[i][j].IDTopic == topicID){
          name = res.locals.allTopics[i][j].Name
          res.locals.allTopics[i][j].active = true;
          break;
        }
      }
    }
  }
 
  let url = `/categories/${catID}?topicID=${topicID}` 
  res.render("vwUserCategory/index", {
    coursesList,
    isEmpty: coursesList.length === 0,
    nPage,
    page,
    topicID: topicID,
    catID: catID,nResults: count,name,
    url
  });
});

export default Router;
