import express from 'express'
import searchEngine from '../services/fullTextSearch-service.js'
const Router = express.Router();
Router.get('/',async (req,res, next)=>{
    let key = req.query.k;
    let url = req.originalUrl;
    let findByName = req.query.byName ;
    let findByCat = req.query.byCat;
    let priceOption = req.query.priceOption;
    
    if (Array.isArray(priceOption)  && priceOption.length >= 2){
        let option = priceOption[priceOption.length-1];
        url = url.replaceAll("&priceOption=asc","");
        url = url.replaceAll("&priceOption=des","");
        priceOption = option
        url += "&priceOption=" + option
    }
        
    let ratingOption = req.query.ratingOption;

    if (Array.isArray(ratingOption)  && ratingOption.length >= 2){
        let option = ratingOption[ratingOption.length-1];
        url = url.replaceAll("&ratingOption=asc","");
        url = url.replaceAll("&ratingOption=des","");
        ratingOption = option
        url += "&ratingOption=" + option
    }
    let isFilter = true;
    if(!findByName && !findByCat && !priceOption && !ratingOption)
        isFilter = false;

    let listID;
    if(findByName && !findByCat)
        listID = await searchEngine.searchByName(key);
    if(!findByName && findByCat)
        listID = await searchEngine.searchByCat(key);
    if(findByName && findByCat)
        listID = await searchEngine.searchBothNameAndCat(key);
    console.log(listID);
    res.render('vwSearch/index',{
        key,
        url,
        isFilter,
        findByName,
        findByCat,
        priceOption,
        ratingOption
    });
})

export default Router;