import express from "express";
import youtubeInfo from "updated-youtube-info";
import multer from "multer";
import bcrypt from "bcrypt";
import middleware from "../middlewares/middleware.js";
import moment from "moment/moment.js";
import coursesService from "../services/courses-service.js";
import categoryService from "../services/category.services.js";
import chapterService from "../services/chapter-service.js";
import discountService from "../services/discountService.js";
import userService from "../services/user-service.js";
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "./public/images/courses");
  },
  filename: function (req, file, cb) {
    const id = req.IDAdded || "undefine";
    cb(null, id + ".jpg");
  },
});
const uploadCreate = multer({
  fileFilter: async (req, file, cb) => {
    const IDAdded = await coursesService.addCourse({});
    req.IDAdded = IDAdded;

    cb(null, true);
  },
  storage: storage,
});
const uploadEdit = multer({
  fileFilter: async (req, file, cb) => {
    req.IDAdded = req.body.ID || 0;
    cb(null, true);
  },
  storage: storage,
});
const Router = express.Router();

Router.use(middleware.isInstructor);
Router.get("/", async (req, res, next) => {
  res.render("vwInstructor/empty", {
    layout: "instructor",
  });
});
Router.get("/create-course", async (req, res, next) => {
  let isAlert = false;
  if (req.query.noti) {
    isAlert = true;
  }
  const listCate = await categoryService.getAllCat();
  res.render("vwInstructor/create-course", {
    layout: "instructor",
    listCate,
    isAlert,
  });
});
Router.post(
  "/create-course",
  uploadCreate.single("image"),
  async (req, res, next) => {
    let IDCourse = req.IDAdded;
    let discountPercent = req.body.Discount;
    let discountRes = await discountService.getDiscount(discountPercent);
    let ModifiedTime = moment().format("yyyy-M-D");
    if (!discountRes || discountRes.length == 0) {
      discountRes = await discountService.addDiscount(discountPercent);
    } else {
      discountRes = discountRes.ID;
    }

    let course = {
      Name: req.body.Name || "",
      IDCategory: req.body.IDCate || 0,
      Topic: req.body.IDTopic || 0,
      TinyDesc: req.body.TinyDes || "",
      FullDesc: req.body.FullDes || "",
      CourseFee: req.body.Price || 0,
      IDDiscount: discountRes || 0,
      IDInstructor: res.locals.auth.IDUser,
      IsCompleted: req.body.isCompleted === "on",
      ModifiedTime,
    };
    if (IDCourse) {
      let resultUpdateCourse = await coursesService.updateCourse(
        IDCourse,
        course
      );
    } else {
      IDCourse = await coursesService.addCourse(course);
    }

    let chapters = req.body.chapter;
    let chapCnt = 1;
    res.redirect("/instructor/create-course?noti=1");
    for (let i = 0; i < chapters.length; i++) {
      let chapter = chapters[i];
      if (chapter) {
        let chapterName = chapter.name;
        delete chapter.name;

        const resultAddChap = await chapterService.addChapter(
          IDCourse,
          chapCnt,
          chapterName
        );
        for (const [key, value] of Object.entries(chapter)) {
          let lectureNum = key;
          let lectureName = value.name;
          let lectureUrl = value.url;
          let videoLength = 0;
          let IsPreview = value.isPreview === "on";
          try {
            const info = await youtubeInfo(`${lectureUrl}`);
            videoLength = info.duration;
          } catch (err) {
            videoLength = 0;
          }
          const resultAddVideo = await coursesService.addVideo({
            IDCourse,
            IDChapter: chapCnt,
            No: lectureNum,
            Name: lectureName,
            URL: lectureUrl,
            Length: videoLength,
            IsPreview,
          });
        }
        chapCnt = chapCnt + 1;
      }
    }
  }
);

Router.get("/cat/:id", async (req, res, next) => {
  let id = req.params.id;
  const list = await categoryService.getTopicByCat(id);
  res.json(list);
});

Router.get("/profile", async (req, res) => {
  const infos = await userService.getInfo(res.locals.auth.IDUser || 0);
  res.render("vwInstructor/profile", { layout: "instructor", infos });
});
Router.get("/my-courses", async (req, res) => {
  const listCourse = await coursesService.getCoursesByInstructor(
    res.locals.auth.IDUser
  );
  res.render("vwInstructor/my-courses", { layout: "instructor", listCourse });
});
Router.post("/profile", async (req, res) => {
  const resultUpdate = await userService.updateInfo(
    res.locals.auth.IDUser,
    req.body
  );
  req.cookies.user.FullName = req.body.FullName;
  req.cookies.user.CurrentJob = req.body.CurrentJob;
  if (req.session.passport) req.session.passport.user = req.cookies.user;
  res.cookie("user", req.cookies.user);
  res.redirect("/instructor/profile");
});
Router.get("/edit/:id", middleware.isOwnCourse, async (req, res) => {
  const ID = req.params.id;
  const listCate = await categoryService.getAllCat();
  const courseInfo = await coursesService.getInfoCourse(ID);
  const chapters = await coursesService.getAllChapters(ID);
  let videos = [];
  let videosLength = [];
  for (let i = 0; i < chapters.length; i++) {
    const videoOfChapter = await coursesService.getAllVideosByChapter(
      ID,
      chapters[i].IDChapter
    );
    videos.push(videoOfChapter);
    videosLength.push(videoOfChapter.length);
  }

  if (courseInfo.ID != ID) return res.render("404", { layout: false });
  res.render("vwInstructor/edit-course", {
    layout: "instructor",
    listCate,
    courseInfo,
    chapters,
    videos,
    chapterLength: chapters.length,
    videosLength,
  });
});

Router.post("/edit/:id", uploadEdit.single("image"), async (req, res, next) => {
  let IDCourse = req.body.ID;
  let discountPercent = req.body.Discount;
  let discountRes = await discountService.getDiscount(discountPercent);
  let ModifiedTime = moment().format("yyyy-M-D");
  if (!discountRes || discountRes.length == 0) {
    discountRes = await discountService.addDiscount(discountPercent);
  } else {
    discountRes = discountRes.ID;
  }

  //Xoá tất cả chapter, video cũ
  const delChap = await chapterService.removeAllChapterOfCourse(IDCourse);
  const delVideos = await coursesService.removeVideoOfCourse(IDCourse);
  
  let course = {
    Name: req.body.Name || "",
    IDCategory: req.body.IDCate || 0,
    Topic: req.body.IDTopic || 0,
    TinyDesc: req.body.TinyDes || "",
    FullDesc: req.body.FullDes || "",
    CourseFee: req.body.Price || 0,
    IDDiscount: discountRes || 0,
    IDInstructor: res.locals.auth.IDUser,
    IsCompleted: req.body.isCompleted === "on",
    ModifiedTime,
  };
  let resultUpdateCourse = await coursesService.updateCourse(IDCourse, course);

  let chapters = req.body.chapter;
  let chapCnt = 1;
  res.redirect("/instructor/create-course?noti=1");
  for (let i = 0; i < chapters.length; i++) {
    let chapter = chapters[i];
    if (chapter) {
      let chapterName = chapter.name;
      delete chapter.name;

      const resultAddChap = await chapterService.addChapter(
        IDCourse,
        chapCnt,
        chapterName
      );
      for (const [key, value] of Object.entries(chapter)) {
        let lectureNum = key;
        let lectureName = value.name;
        let lectureUrl = value.url;
        let videoLength = 0;
        let IsPreview = value.isPreview === "on";
        try {
          const info = await youtubeInfo(`${lectureUrl}`);
          videoLength = info.duration;
        } catch (err) {
          videoLength = 0;
        }
        const resultAddVideo = await coursesService.addVideo({
          IDCourse,
          IDChapter: chapCnt,
          No: lectureNum,
          Name: lectureName,
          URL: lectureUrl,
          Length: videoLength,
          IsPreview,
        });
      }
      chapCnt = chapCnt + 1;
    }
  }
});
Router.get("/account", (req, res, next) => {
  res.render("vwInstructor/account", {
    layout: "instructor",
  });
});
Router.post("/change-email", async (req, res, next) => {
  const newEmail = req.body.email;
  if (newEmail == res.locals.auth.Email)
    return res.render("vwInstructor/account", {
      layout: "instructor",
      isAlert: true,
      icon: "info",
      title: "You have entered your current Email!",
    });
  const isExists = await userService.isEmailExists(newEmail);
  if (isExists)
    return res.render("vwInstructor/account", {
      layout: "instructor",
      isAlert: true,
      icon: "error",
      title: "Email already exists!",
    });
  const resultChange = await userService.changeEmail(
    res.locals.auth.IDUser,
    newEmail
  );
  req.cookies.user.Email = newEmail;
  if (req.session.passport) {
    req.session.passport.user.Email = newEmail;
  }
  res.cookie("user", req.cookies.user);
  return res.render("vwInstructor/account", {
    layout: "instructor",
    isAlert: true,
    icon: "success",
    title: "Email changed successfully.",
  });
});
Router.post("/change-password", async (req, res, next) => {
  const password = req.body.password;
  const hashedPassword = await bcrypt.hash(password, 5);
  const resultChange = await userService.changePassword(
    res.locals.auth.IDUser,
    hashedPassword
  );
  return res.render("vwInstructor/account", {
    layout: "instructor",
    isAlert: true,
    icon: "success",
    title: "Password changed successfully.",
  });
});
export default Router;
