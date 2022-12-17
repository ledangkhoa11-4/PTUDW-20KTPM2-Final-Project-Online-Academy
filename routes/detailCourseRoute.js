import express from "express";
import coursesService from "../services/courses-service.js";
const Router = express.Router();

Router.get("/", async (req, res) => {
  const IDcourse = req.query.id || 0;
  const course = await coursesService.getInfoCourse(`${IDcourse}`);
  console.log(course);
  if (course === null) {
    return res.redirect("/home");
  }
  res.render("vwCourse/detail", { layout: "main", course });
});
export default Router;
