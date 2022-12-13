import _ from './config/config.js'
import express, { urlencoded } from 'express';
import {engine} from 'express-handlebars'
import express_handlebars_sections from 'express-handlebars-sections'

import db from './utils/db.js'
//Route
import authRoute from './routes/authRoute.js'
import searchRoute from './routes/searchRoute.js'
const app = express();
app.use('/public',express.static("public"))

app.use(urlencoded({
    extended: false,
}))

app.engine('hbs', engine({
    extname: 'hbs',
    helpers:{
        section: express_handlebars_sections()
    }
    
}));
app.set('view engine', 'hbs');
app.set('views', './views');



app.get("/", (req,res)=>{
    res.render("home")
})
app.use("/auth",authRoute);
app.use('/search',searchRoute);

app.listen(process.env.PORT, ()=>{
    console.log(`Server running at http://127.0.0.1:${process.env.PORT}`);
})
