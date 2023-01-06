import _ from "./config/config.js";
import asyncError from 'express-async-errors';
import express, { urlencoded } from "express";
import { engine } from "express-handlebars";
import express_handlebars_sections from "express-handlebars-sections";
import session from "express-session";
import cookieParser from "cookie-parser";
import numeral from "numeral";
import formatTime from "humanize-duration";
import categoryServices from "./services/category.services.js";
import passport from "passport";
import settingStrategy from "./config/passport-Strategy.js";

//Route
import authRoute from './routes/authRoute.js'
import searchRoute from './routes/searchRoute.js'
import homeRoute from './routes/homeRoute.js'
import categoriesRoute from './routes/categoriesRoute.js'
import userCategoriesRoute from './routes/userCategoriesRoute.js'
import detailCourseRoute from "./routes/detailCourseRoute.js";
import moment from 'moment/moment.js';
import admin_userRoute from './routes/admin-userRoute.js';
import instructorRoute from './routes/instructorRoute.js';
import userRoute from './routes/userRoute.js';
const app = express();


app.use("/public", express.static("public"));
app.use(cookieParser());
app.use(
  express.urlencoded({
    extended: true,
  })
);
app.use(
  session({
    secret: "keyboard cat",
    resave: false,
    saveUninitialized: true,
    cookie: { secure: false },
  })
);
settingStrategy(passport);
app.use(passport.initialize());
app.use(passport.session())

app.engine('hbs', engine({
    extname: 'hbs',
    helpers:{
        section: express_handlebars_sections(),
        convertMinuteToHour(minute){ //second not minute
            return formatTime(minute * 1000,{ units: ["d", "h", "m"], round: true });
        },
        ratingConvert(ratingScore){
            if(ratingScore)
                return ratingScore;
            return 0
        },
        formatCurrency(currency){
            if(currency === "")
                return ""
            if(currency <= 0)
            return "Free"
            return numeral(currency).format('0,0') + "đ";
        },
        calculateOldPrice(){
            return null;
        },
        calculateNewPrice(percent, price){
            if(!percent)
                percent = 0;
            return (price - (price*percent)/100).toPrecision(4);
        },
        isEmpty(array){
            return array.length === 0;
        },
        isAsc(text){
            return text === "asc"
        },
        isDes(text){
            return text === "des"
        },
        formatDate(date){
          return moment(date).format('LLLL');
        },
        ifeq: function(a, b, options){
          if (a === b) {
            return options.fn(this);
            }
          return options.inverse(this);
        },
        isMatch(txt1, txt2){
            return txt1 == txt2;
        },
        add1(num){
          return num+1;
        },
        roleToString(role){
          if(role == 0) return "Administrator";
          if(role == 1 ) return "Instructor";
          if(role == 2) return "Student"
        }
    }
    
}));
app.set('view engine', 'hbs');
app.set('views', './views');


//res.local
app.use(async (req, res, next) => {
  const cateList = await categoryServices.getAllCat();
  let cateTree = [];
  for (let i = 0; i < cateList.length; i++) {
    const topic = await categoryServices.getTopicByCat(cateList[i].IDCate);
    const item = { ...cateList[i], topic };
    cateTree.push(item);
  }
  res.locals.cateTree = cateTree;
  if (req.cookies.user) {
    res.locals.isLogged = true;
    res.locals.auth = req.cookies.user;
  }
  if (req.session.passport) {
    req.session.passport.user
    res.locals.isLogged = true;
    res.locals.auth = req.session.passport.user;
    res.cookie("user", req.session.passport.user);
  }
  next();
});


app.use("/", homeRoute);
app.use("/auth",authRoute);
app.use('/search',searchRoute);
app.use('/admin',categoriesRoute);
app.use('/admin',admin_userRoute);
app.use('/categories',userCategoriesRoute);
app.use("/course", detailCourseRoute);
app.use("/instructor", instructorRoute);
app.use("/user",userRoute);


app.use((err,req,res, next)=> {
  console.log(err);
  next();
})
app.use((req,res)=>res.status(404).render('404',{layout: false}))

app.listen(process.env.PORT, ()=>{
    console.log(`Server running at http://127.0.0.1:${process.env.PORT}`);
})


