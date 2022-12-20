import express from 'express'
import multer from 'multer';
import coursesService from '../services/courses-service.js';
import categoryService from '../services/category.services.js';
import chapterService from '../services/chapter-service.js';
import discountService from '../services/discountService.js';
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, './public/images/courses')
    },
    filename: function (req, file, cb) {
      const id = req.IDAdded || 'undefine';
      cb(null, id + '.jpg')
    }
})
const upload = multer({ 
    fileFilter : async (req, file, cb) => { 
        const IDAdded = await coursesService.addCourse({});
        req.IDAdded = IDAdded;
        cb(null, true)
     },
    storage: storage,
})

const Router = express.Router();

Router.use((req, res, next)=>{
    if(res.locals.auth){
        if(res.locals.auth.Role == 1)
            return next();
    }
    res.render('403', {layout: false});
})
Router.get('/create-course',async (req,res, next)=>{
    const listCate = await categoryService.getAllCat();
    res.render('vwInstructor/create-course',{
        listCate
    })
})
Router.post('/create-course',upload.single('image'),async (req,res, next)=>{
    let IDCourse = req.IDAdded;
    let discountPercent = req.body.Discount;
    let discountRes = await discountService.getDiscount(discountPercent);
    if(!discountRes || discountRes.length == 0){
        discountRes = await discountService.addDiscount(discountPercent);
    }else{
        discountRes = discountRes.ID
    }
    
    let course = {
        Name: req.body.Name || "",
        IDCategory: req.body.IDCate || 0,
        Topic: req.body.IDTopic || 0 ,
        TinyDesc: req.body.TinyDes || "",
        FullDesc: req.body.FullDes || "",
        CourseFee: req.body.Price || 0,
        IDDiscount: discountRes || 0,
        IDInstructor: res.locals.auth.IDUser,
        IsCompleted : req.body.isCompleted === 'on', 
    }
    if(IDCourse){
        let resultUpdateCourse = await coursesService.updateCourse(IDCourse, course);
    }else{
        IDCourse = await coursesService.addCourse(course)
    }
    
    let chapters = req.body.chapter;
    let chapCnt = 1;
    for(let i = 0; i< chapters.length; i++){
        let chapter = chapters[i];
        if(chapter){
            let chapterName = chapter.name;
            delete chapter.name;
            
            const resultAddChap = await chapterService.addChapter(IDCourse,chapCnt,chapterName);
            for (const [key, value] of Object.entries(chapter)) {
                let lectureNum = key
                let lectureName = value.name;
                let lectureUrl = value.url;
                const resultAddVideo = await coursesService.addVideo({
                    IDCourse, IDChapter: chapCnt, No: lectureNum, Name: lectureName,URL: lectureUrl
                })
            }
            chapCnt = chapCnt + 1;
        }
    }
    res.json(req.body);
})

Router.get('/cat/:id',async (req,res, next)=>{
    let id = req.params.id;
    const list = await categoryService.getTopicByCat(id);
    res.json(list);
})
export default Router;