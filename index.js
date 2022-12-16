import _ from './config/config.js'
import express, { urlencoded } from 'express';
import {engine} from 'express-handlebars'
import express_handlebars_sections from 'express-handlebars-sections'
import numeral from 'numeral';
import categoryServices from './services/category.services.js';
import courseService from "./services/courses-service.js"
//Route
import authRoute from './routes/authRoute.js'
import searchRoute from './routes/searchRoute.js'
import homeRoute from './routes/homeRoute.js'
import categoriesRoute from './routes/categoriesRoute.js'
import userCategoriesRoute from './routes/userCategoriesRoute.js'
const app = express();
app.use('/public',express.static("public"))

app.use(urlencoded({
    extended: false,
}))

app.engine('hbs', engine({
    extname: 'hbs',
    helpers:{
        section: express_handlebars_sections(),
        convertMinuteToHour(minute){
            return  (minute/60).toPrecision(4) + "";
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
        calculateOldPrice(percent, price){
            if(!percent)
                return "";
            return ((price*percent)/100).toPrecision(4) + "";
        },
        isEmpty(array){
            return array.length === 0;
        },
    }
    
}));
app.set('view engine', 'hbs');
app.set('views', './views');

//res.local
app.use(async (req,res,next)=>{
    const cateList = await categoryServices.getAllCat();
    let cateTree = [];
    for(let i = 0; i< cateList.length; i++){
        const topic = await categoryServices.getTopicByCat(cateList[i].IDCate);
        const item = {...cateList[i], topic}
        cateTree.push(item);
    }
    res.locals.cateTree = cateTree;
    next();
})

app.use("/", homeRoute)
app.use("/auth",authRoute);
app.use('/search',searchRoute);
app.use('/admin',categoriesRoute);
app.use('/categories',userCategoriesRoute);
app.listen(process.env.PORT, ()=>{
    console.log(`Server running at http://127.0.0.1:${process.env.PORT}`);
})
