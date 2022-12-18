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
  console.log(chapters);
  const videos = await coursesService.getAllVideos(`${IDcourse}`);
  console.log("----");
  console.log(videos);
  res.render("vwCourse/detail", { layout: "main", course, chapters, videos });
});
export default Router;
