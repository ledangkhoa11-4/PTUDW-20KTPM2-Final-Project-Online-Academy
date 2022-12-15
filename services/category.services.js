import db from '../utils/db.js';

export default{
    getAllCat: async()=>{
        const list = await db.raw("Select * From category");
        if(list)
            return list[0]
        return list;
    },
    getTopicByCat: async(IDCate)=>{
        const list = await db.raw(`Select * From topic t Where t.IDCate = ${IDCate}`);
        if(list)
            return list[0]
        return list;
    }
}