import express from 'express'
import coursesService from '../services/courses-service.js';
import userService from '../services/user-service.js';
import categoryServices from '../services/category.services.js';
import bcrypt from 'bcrypt';
import { match } from 'assert';
import middleware from '../middlewares/middleware.js';
const Router = express.Router();
Router.use(middleware.isAdmin);
Router.get('/user',async(req,res, next)=>{
    const role= req.query.role;
    const list=await userService.getAllUserByRole(role);

    res.render('vwAdminUser/User.hbs',{
        layout:'admin',
        list,
        role,
        isEmpty: list.lenght===0
    })
})
Router.get('/instructor', async (req,res)=>{
    const UserId=req.query.id||0;
    const role=req.query.role;
    const instructor= await userService.findUserById(UserId);
    //const courses =await coursesService.findByIDInstructor(UserId);
    const page = req.query.p || 1;
    const limit = 5;
    const offset = (page - 1) * limit;
    const list=await coursesService.getCourseByPageandUserId(UserId,limit,offset);
    const totalCourse=await coursesService.getTotalCourseByInstructorID(UserId);
    let nPage=Math.ceil(totalCourse/limit);
    let isAlert=false;
    if(req.query.alert)
        isAlert=true;
    res.render('vwAdminUser/instructor.hbs',{
        layout: 'admin',
        instructor,
        courses: list,
        isAlert,
        icon:'error',
        title:'Instructor did not exist',
        isEmpty: list.length===0,
        page,
        nPage,
        url:`/admin/instructor?id=${UserId}&role=${role}`

    });

})
Router.get('/instructor/add', async (req,res)=>{
    const UserId=req.query.id||0;
    const role=req.query.role;
    let isAlert=false;
    let icon,title;
    const alert=req.query.alert||0;
    if(alert===1){
        isAlert=true;
        icon='error',
        title='Your email is exist!'
    }
     else if(alert===2) {
        isAlert=true;
        icon='success',
        title='Instructor has been added!!'
     }   
    const instructor= await userService.findUserById(UserId);
    
    res.render('vwAdminUser/add_Instructor.hbs',{
        layout: 'admin',
        instructor,
        isAlert,
        icon,
        title
        
    });

})
Router.post('/instructor/add', async (req,res)=>{
    const instructor=req.body;
    const role=req.query.role;
    const hashedPassword = await bcrypt.hash(instructor.password, 5);
    const isEmailExist= await userService.isEmailExists(instructor.username);
    let alert;
    if(isEmailExist){
       res.render('vwAdminUser/add_Instructor',{
        layout: 'admin',
        isAlert:true,
        icon:'error',
        title:'Your email is exist!'
       })
       return;
    }
    else{
        const result = await userService.addUser({
        
            Email: instructor.username,
            FullName: 'New instructor',
            Password: hashedPassword,
            Role: role,
            OTP: 0
        })
        res.render('vwAdminUser/add_Instructor',{
            layout:'admin',
            isAlert:true,
            icon:'success',
            title:'Instructor has been added!!'
        }
       )
        
    }
    
    
})


//Student
Router.get('/student', async (req,res)=>{
    const UserId=req.query.id||0;
    const role=req.query.role;
    const student= await userService.findUserById(UserId);
    const courses =await coursesService.findByIDStudent(UserId);
    

    res.render('vwAdminUser/student.hbs',{
        layout:'admin',
        student,
        courses,
    })

})
Router.post('/user/disable',async(req,res)=>{
    const userId=req.query.id||0;
    const status=req.body.status;
    if(status==='disable'){
        const ret=await userService.disabledUser(userId,1);
    }
    else{
        const ret=await userService.disabledUser(userId,0)
    }
    res.redirect('back');
    
})
Router.get('/courses', async (req,res)=>{

const page = req.query.p || 1;
const limit = 10;
const offset = (page - 1) * limit;
const instructorID=req.query.instructor||0;
const catId=req.query.catId||0;
const topicId=req.query.topicId||0;
let list;
let totalCourse;
let url;
if(catId===0){
     list=await coursesService.getCourseByPage(limit,offset);
     totalCourse=await coursesService.getTotalCourse();
     url='/admin/courses?';
}else{
    if(topicId===0){
     list=await coursesService.getCourseByPageAndCatID(catId,limit,offset);
     totalCourse=await coursesService.getTotalCourseByCatId(catId);
     url=`/admin/courses?catId=${catId}`;
    }
    else{
        list=await coursesService.getCourseByPageAndCatIDAndTopicID(catId,topicId,limit,offset);
        totalCourse=await coursesService.getTotalCourseByTopicID(catId,topicId)
        url=`/admin/courses?catId=${catId}&topic=${topicId}`
    }
}
if(instructorID!==0){
    list=await coursesService.getCourseByPageAndInstructorID(instructorID,limit,offset);
    totalCourse=await coursesService.getTotalCourseByInstructorID(instructorID);
    url=`/admin/courses?instructor=${instructorID}`
}


const category=await categoryServices.getAllCat();
const instructor=await userService.getAllUserByRole(1);
for(let i=0;i<instructor.length;i++){
    if(instructor[i].IDUser==instructorID){
        instructor[i].active=true;
    }
}
console.log(instructor);
let topics = [];
  for(let i = 0; i< category.length;i++){
    const topic = await categoryServices.getTopicByCat(category[i].IDCate);
    if(category[i].IDCate==catId){
        category[i].active=true;
    }
    
    for(let j=0;j<topic.length;j++){
        if(topic[j].IDTopic==topicId){
        topic[j].active=true;
    }
    }
   // console.log(topic);
    topics.push(topic)
  }
  


let nPage=Math.ceil(totalCourse/limit);
res.render('vwAdminUser/courses',{
    layout:'admin',
    showFilter:true,
    list,
    isEmpty: list.length===0,
    nPage,
    topics,
    page,
    url,
    category,
    instructor
})
})
Router.post('/course/disabled', async(req,res)=>{
    const status=req.body.status;
    const ID=req.query.id
    if(status==='disable'){
        const ret=await coursesService.disabledCourse(ID,1);
        console.log("cc");
    }
    else{
        const ret=await coursesService.disabledCourse(ID,0)
    }
    res.redirect('back')
})
export default Router;