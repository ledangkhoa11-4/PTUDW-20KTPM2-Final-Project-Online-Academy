import express from 'express'
import coursesService from '../services/courses-service.js';
import userService from '../services/user-service.js';
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
Router.post('/instructor/del',async(req,res)=>{
    const userId=req.query.id||0;
    
    
    const isExist=await userService.isExist(userId);
    if(!isExist){
        res.redirect('/admin/instructor?id=${userId}&alert=1');
    }
    else{
        const ret=await userService.del(userId);
        return res.redirect('/admin/user?role=1')
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
Router.post('/student/del',async(req,res)=>{
    const userId=req.query.id||0;
    
    
    
        const ret=await userService.del(userId);
        return res.redirect('/admin/user?role=2');
    
})
Router.get('/courses', async (req,res)=>{

const page = req.query.p || 1;
const limit = 10;
const offset = (page - 1) * limit;
const list=await coursesService.getCourseByPage(limit,offset);
const totalCourse=await coursesService.getTotalCourse();
let nPage=Math.ceil(totalCourse/limit);
res.render('vwAdminUser/courses',{
    layout:'admin',
    list,
    isEmpty: list.lenght===0,
    nPage,
    page,
    url:'/admin/courses?'
})
})
export default Router;