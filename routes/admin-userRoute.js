import express from 'express'
import coursesService from '../services/courses-service.js';
import userService from '../services/user-service.js';
import bcrypt from 'bcrypt';
const Router = express.Router();
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
    const courses =await coursesService.findByIDInstructor(UserId);
    let isAlert=false;
    if(req.query.alert)
        isAlert=true;
    res.render('vwAdminUser/instructor.hbs',{
        layout: 'admin',
        instructor,
        courses,
        isAlert,
        icon:'error',
        title:'Instructor did not exist',
        isEmpty: courses.length===0
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
    let isEmpty=false;
    if(courses===[]){
        console.log('cc');
         isEmpty=true;
    }

    res.render('vwAdminUser/student.hbs',{
        layout:'admin',
        student,
        courses,
        isEmpty
    })

})
Router.get('/courses', async (req,res)=>{
const list=await coursesService.getAllCourses();
res.render('vwAdminUser/courses',{
    layout:'admin',
    list,
    isEmpty: list.lenght===0
})
})
export default Router;