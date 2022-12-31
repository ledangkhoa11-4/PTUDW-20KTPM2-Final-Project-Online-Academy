import express from "express";
import middleware from "../middlewares/middleware.js";
import coursesService from "../services/courses-service.js";
const Router = express.Router();
Router.use(middleware.isStudent);
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
Router.get("/watched", async (req, res) => {
  const courseId = req.query.courseId || 0;
  const chapterId = req.query.chapterId || 0;
  const no = req.query.No || 0;
  const result = await coursesService.addWatchedVideo(
    res.locals.auth.IDUser,
    courseId,
    chapterId,
    no
  );
});
Router.get("/:courseId", async (req, res) => {
  const courseId = req.params.courseId;
  const chapterId = req.query.chapterId || 0;
  const lectureId = req.query.lectureId || 0;

  const chapters = await coursesService.getAllChapters(courseId);
  const videos = [];

  for (let i = 0; i < chapters.length; i++) {
    let videoOfChapter = await coursesService.getAllVideosByChapter(
      chapters[i].IDCourse,
      chapters[i].IDChapter
    );
    videos.push(videoOfChapter);
  }

  let crrVideo = await coursesService.getVideo(courseId, chapterId, lectureId);
  crrVideo.URL = "https://www.youtube.com/embed/" + crrVideo[0].URL;
  crrVideo.isCrr = true;
  crrVideo.Name = crrVideo[0].Name;
  //console.log(crrVideo);

  res.render("vwCourse/videoLecture", {
    layout: "main",
    chapters,
    videos,
    crrVideo,
  });
});
export default Router;
