import _ from './config/config.js'
import express, { urlencoded } from 'express';
import {engine} from 'express-handlebars'

const app = express();

app.use(urlencoded({
    extended: false,
}))

app.engine('hbs', engine({
    extname: 'hbs'
}));
app.set('view engine', 'hbs');
app.set('views', './views');




app.use("/", (req,res)=>{
    res.render("home")
})


app.listen(process.env.PORT, ()=>{
    console.log("Server running at port " + process.env.PORT);
})
