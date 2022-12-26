import coursesService from "../services/courses-service.js";
export default {
    isInstructor: (req, res, next)=>{
        if(res.locals.auth){
            if(res.locals.auth.Role == 1)
                return next();
        }
        res.render('403', {layout: false});
    },
    isOwnCourse:async (req, res, next)=>{
        const instructor = await coursesService.getInsByCourse(req.params.id);
        if(!instructor || res.locals.auth.IDUser != instructor.IDInstructor){
            return res.render('403', {layout: false});;
        }
        return next();  
    }
}