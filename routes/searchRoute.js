import express from 'express'
import searchEngine from '../services/fullTextSearch-service.js'
import fn from '../services/courses-service.js'
const Router = express.Router();


Router.get('/',async (req,res, next)=>{
    let key = req.query.k;
    res.locals.keySearch = key;
    let url = req.originalUrl;
    let findByName = req.query.byName ;
    let findByCat = req.query.byCat;
    let priceOption = req.query.priceOption;
    let currentPage = req.query.p || 1;
    url = url.replaceAll(/&p=[0-9]/g,"");

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
    let anchor = true;
    if( !findByCat && !priceOption && !ratingOption){
        isFilter = false;
        anchor = false
    }
        

    let listID = [], order1 = null, order2 = null, limit = 3, offset = (currentPage * limit - limit)||0, totalPage = 0;
    if(priceOption === 'asc')
        order1 = "(c.CourseFee - c.CourseFee*actualDiscount/100) asc"
    if(priceOption === 'des')
        order1 = "(c.CourseFee - c.CourseFee*actualDiscount/100) desc"   
    if(ratingOption === 'asc')
        order2 = "AVG(p.Rating) asc"
    if(ratingOption === 'des')
        order2 = "AVG(p.Rating) desc"   
    
    if(findByName && !findByCat){
        totalPage = await searchEngine.countSearchByName(key);
        listID = await searchEngine.searchByName(key,order1,order2,limit,offset);
    }
        
    if(!findByName && findByCat){
        totalPage = await searchEngine.countSearchByCat(key);
        listID = await searchEngine.searchByCat(key,order1,order2,limit,offset);
    }
        
    if(findByName && findByCat){
        totalPage = await searchEngine.countSearchBothNameAndCat(key);
        listID = await searchEngine.searchBothNameAndCat(key,order1,order2,limit,offset);
    }
    let totalResult = totalPage.cnt;
    totalPage = Math.ceil(totalResult / limit);

    let newest = await searchEngine.searchBothNameAndCat(key,'c.CreatedTime desc',null,1,0);
    let bestSell = await searchEngine.searchBothNameAndCat(key,'COUNT(c.ID) desc',null,1,0);
    let bestRating = await searchEngine.searchBothNameAndCat(key,'AVG(p.Rating) desc',null,1,0);
    let searchResult = [];
    for(let i = 0; i< listID.length; i++){
        const info = await fn.getInfoCourse(listID[i].ID);
        searchResult.push(info);
    }
   
    try{
        if(bestSell[0].ID == newest[0].ID)
            bestSell = []
        if(bestRating[0].ID == newest[0].ID || bestRating[0].ID == bestSell[0].ID)
            bestRating = []
        
    }catch(err){}
    
    let newestCourse = null
    let bestSellCourse = null
    let bestRatingCourse = null
    if(newest.length > 0)
        newestCourse = await fn.getInfoCourse(newest[0].ID);
    if(bestSell.length > 0)
        bestSellCourse = await fn.getInfoCourse(bestSell[0].ID);
    if(bestRating.length > 0)    
        bestRatingCourse = await fn.getInfoCourse(bestRating[0].ID);
    res.render('vwSearch/index',{
        key,
        url,
        totalResult,
        isFilter,
        findByName,
        findByCat,
        priceOption,
        ratingOption,
        anchor,
        currentPage,
        totalPage,
        length: listID.length,
        result: searchResult,
        newestCourse,
        bestSellCourse,
        bestRatingCourse
    });
})

export default Router;