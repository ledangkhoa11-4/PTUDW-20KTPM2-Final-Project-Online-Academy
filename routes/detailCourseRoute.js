import express from "express";
import coursesService from "../services/courses-service.js";
const Router = express.Router();

Router.get("/", async (req, res) => {
  const IDcourse = req.query.id || 0;
  const course = await coursesService.getInfoCourse(`${IDcourse}`);
  //console.log(course);
  if (course === null) {
    return res.redirect("/home");
  }
  const chapters = await coursesService.getAllChapters(`${IDcourse}`);
  //console.log(chapters);
  //console.log("----");
  //console.log(videos);
  const videos = [];

  for (let i = 0; i < chapters.length; i++) {
    let videoOfChapter = await coursesService.getAllVideosByChapter(
      chapters[i].IDCourse,
      chapters[i].IDChapter
    );
    videos.push(videoOfChapter);
  }
  //console.log(course);
  const topicID = course.IDTopic;
  const catID = course.IDCate;
  const page = req.query.p || 1;
  const limit = 5;
  const offset = (page - 1) * limit;

  const list = await coursesService.getCourseIDByTopicPage(
    catID,
    topicID,
    limit,
    offset
  );
  // console.log(list);
  const temp = await coursesService.getCourseIDByTopic(catID, topicID);
  const name = await coursesService.getCourseNameByCat(catID);
  const count = temp.length;
  let nPage = Math.floor(count / limit);
  if (count % limit > 0) nPage++;
  let coursesList = [];

  for (let i = 0; i < list.length; i++) {
    const info = await coursesService.getInfoCourse(list[i].ID);
    coursesList.push(info);
  }

  const feedback = await coursesService.getFeedbackByCourse(IDcourse);
  //console.log(feedback);
  res.render("vwCourse/detail", {
    layout: "main",
    course,
    chapters,
    videos,
    coursesList,
    feedback,
  });
});
export default Router;
