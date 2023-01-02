import coursesService from "../services/courses-service.js";
export default {
  isInstructor: (req, res, next) => {
    if (res.locals.auth) {
      if (res.locals.auth.Role == 1) return next();
      res.status(403).render("403", { layout: false });
    } else {
      return res.redirect("/auth/login");
    }
  },
  isOwnCourse: async (req, res, next) => {
    const instructor = await coursesService.getInsByCourse(req.params.id);
    if (!instructor || res.locals.auth.IDUser != instructor.IDInstructor) {
      return res.status(403).render("403", { layout: false });
    }
    return next();
  },
  isStudent: (req, res, next) => {
    if (res.locals.auth) {
      if (res.locals.auth.Role == 2) return next();
      res.status(403).render("403", { layout: false });
    } else {
      return res.redirect("/auth/login");
    }
  },
  isAdmin: (req, res, next) => {
    if (res.locals.auth) {
      if (res.locals.auth.Role == 0) return next();
      res.status(403).render("403", { layout: false });
    } else {
      return res.redirect("/auth/login");
    }
  },
};
