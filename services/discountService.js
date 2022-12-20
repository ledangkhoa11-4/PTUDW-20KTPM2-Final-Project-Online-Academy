import db from "../utils/db.js";

db.raw('ALTER TABLE `discount` CHANGE `ID` `ID` INT(11) NOT NULL AUTO_INCREMENT;')
export default {
    getDiscount: async(percent)=>{
        const result = await db('discount').where({PercentDiscount: percent});
        return result[0];
    },
    addDiscount: async(percent)=>{
        const result = await db('discount').insert({PercentDiscount: percent});
        return result[0];
    }
}