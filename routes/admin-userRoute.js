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
    res.render('vwAdminUser/instructor.hbs',{
        layout: 'admin',
        instructor,
        courses
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
    console.log(isEmailExist);
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

export default Router;