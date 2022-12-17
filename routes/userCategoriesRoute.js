import express from "express";
import coursesService from "../services/courses-service.js";

const Router = express.Router();
Router.get("/", async (req, res, next) => {
  const id = req.query.id;
  const page = req.query.p || 1;
  const nextPage = parseInt(page) + 1;
  const prevPage = parseInt(page) - 1;
  const limit = 2;
  const offset = (page - 1) * limit;

  const list = await coursesService.getCourseIDByCatPage(id, limit, offset);
  const temp = await coursesService.getCourseIDByCat(id);
  const count = temp.length;
  let nPage = Math.floor(count / limit);
  if (count % limit > 0) nPage++;
  let coursesList = [];

  for (let i = 0; i < list.length; i++) {
    const info = await coursesService.getInfoCourse(list[i].ID);
    coursesList.push(info);
  }
  res.render("vwUserCategory/index", {
    coursesList,
    isEmpty: coursesList.length === 0,
    nPage,
    page,
    id,
  });
});

export default Router;
