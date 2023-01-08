import express from "express";
import middleware from "../middlewares/middleware.js";
import coursesService from "../services/courses-service.js";
import userService from "../services/user-service.js";
import categoryService from "../services/category.services.js";
const Router = express.Router();
Router.get("/", async (req, res) => {
  const listCate = await categoryService.getAllCat();
  const IDcourse = req.query.id || 0;
  const course = await coursesService.getInfoCourse(`${IDcourse}`);

  if (course === null) {
    return res.redirect("/home");
  }
  const vw = await coursesService.addViewer(IDcourse);
  const chapters = await coursesService.getAllChapters(`${IDcourse}`);
  const videos = [];

  for (let i = 0; i < chapters.length; i++) {
    let videoOfChapter = await coursesService.getAllVideosByChapter(
      chapters[i].IDCourse,
      chapters[i].IDChapter
    );
    videos.push(videoOfChapter);
  }

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

  const feedback = await coursesService.getFeedbackByCourse(
    IDcourse,
    limit,
    offset
  );
  //console.log(feedback);
  let isOwn = false;
  let isOnWatchList = false;
  if (res.locals.auth) {
    isOwn = await coursesService.getParticipant(
      IDcourse,
      res.locals.auth.IDUser
    );
    isOnWatchList = await coursesService.isOnWatchList(
      IDcourse,
      res.locals.auth.IDUser
    );
  }
  let isAuth = false;
  if (res.locals.auth) isAuth = true;
  let numOfStudent = await coursesService.getNumberParticipant(IDcourse);
  numOfStudent = numOfStudent[0].num;

  const idIns = await coursesService.getInsByCourse(IDcourse);
  const ins = await userService.getInfo(idIns.IDInstructor);

  res.render("vwCourse/detail", {
    layout: "main",
    course,
    chapters,
    videos,
    coursesList,
    feedback,
    isOwn,
    isAuth,
    isOnWatchList,
    numOfStudent,
    ins,
    listCate,
  });
});
Router.get("/watched", middleware.isStudent, async (req, res) => {
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
Router.get("/removeWatched", middleware.isStudent, async (req, res) => {
  const courseId = req.query.courseId || 0;
  const chapterId = req.query.chapterId || 0;
  const no = req.query.No || 0;
  const result = await coursesService.removeWatchedVideo(
    res.locals.auth.IDUser,
    courseId,
    chapterId,
    no
  );
});
Router.get("/buy", middleware.isStudent, async (req, res) => {
  const courseId = req.query.courseId || 0;
  const result = await coursesService.addParticipant(
    res.locals.auth.IDUser,
    courseId
  );
});
Router.get("/addWatchList", middleware.isStudent, async (req, res) => {
  const courseId = req.query.courseId || 0;
  const result = await coursesService.addWatchList(
    res.locals.auth.IDUser,
    courseId
  );
});
Router.get("/removeWatchList", middleware.isStudent, async (req, res) => {
  const courseId = req.query.courseId || 0;
  const result = await coursesService.removeWatchList(
    res.locals.auth.IDUser,
    courseId
  );
});
Router.post("/feedback", middleware.isStudent, async (req, res) => {
  const courseId = req.body.courseId;
  const star = req.body.star;
  let fb = req.body.fb;
  fb = fb.replaceAll("'", "''");
  const upFeedback = await coursesService.addFeedback(
    courseId,
    res.locals.auth.IDUser,
    fb
  );
  const upRating = await coursesService.addRating(
    courseId,
    res.locals.auth.IDUser,
    star
  );

  res.json({ thankiu: "Thank you" });
});
Router.get("/:courseId", middleware.isStudent, async (req, res) => {
  const courseId = req.params.courseId;
  const chapterId = req.query.chapterId || 0;
  const lectureId = req.query.lectureId || 0;

  const chapters = await coursesService.getAllChapters(courseId);
  const videos = [];

  for (let i = 0; i < chapters.length; i++) {
    let videoOfChapter = await coursesService.getAllVideoOfChapterByStudent(
      res.locals.auth.IDUser,
      chapters[i].IDCourse,
      chapters[i].IDChapter
    );
    videos.push(videoOfChapter);
  }

  let crrVideo = await coursesService.getVideo(courseId, chapterId, lectureId);
  crrVideo.URL = "https://www.youtube.com/embed/" + crrVideo[0].URL;
  crrVideo.isCrr = true;
  crrVideo.Name = crrVideo[0].Name;

  // let numOfStudent = await coursesService.getNumberParticipant(IDcourse);
  // numOfStudent = numOfStudent[0].num;
  let numWatchedVideo = await coursesService.getNumOfVideoWatchedByStudent(
    courseId,
    res.locals.auth.IDUser
  );
  numWatchedVideo = numWatchedVideo[0].num;
  let numVideoOfCourse = await coursesService.getAllNumOfVideoByCourse(
    courseId
  );
  numVideoOfCourse = numVideoOfCourse[0].num;
  if (numWatchedVideo > numVideoOfCourse) {
    let delPro = await coursesService.removeProgressOfStudentByCourse(
      courseId,
      res.locals.auth.IDUser
    );
    numWatchedVideo = 0;
  }
  let progress = 0;
  if (numWatchedVideo == numVideoOfCourse) {
    let finish = await coursesService.setFinishCourseByStudent(
      courseId,
      res.locals.auth.IDUser
    );
    progress = 100;
  } else {
    let finish = await coursesService.setUnfinishCourseByStudent(
      courseId,
      res.locals.auth.IDUser
    );
    progress = parseInt((numWatchedVideo * 100) / numVideoOfCourse);
  }

  let isFinish = await coursesService.getInfoParticipateByStudentFinishCourse(
    courseId,
    res.locals.auth.IDUser
  );

  if (isFinish[0].finish == 1) isFinish = true;
  else isFinish = false;
  const course = await coursesService.getInfoCourse(`${courseId}`);
  let numOfStudent = await coursesService.getNumberParticipant(courseId);
  numOfStudent = numOfStudent[0].num;
  res.render("vwCourse/videoLecture", {
    layout: "main",
    chapters,
    videos,
    crrVideo,
    course,
    progress,
    isFinish,
    numOfStudent,
  });
});

export default Router;
