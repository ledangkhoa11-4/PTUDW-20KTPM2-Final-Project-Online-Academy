import db from '../utils/db.js';

export default{
    getAllCat: async()=>{
        const list = await db.raw("Select * From category");
        if(list)
            return list[0];
        return list;
    },
    getTopicByCat: async(IDCate)=>{
        const list = await db.raw(`Select * From topic t Where t.IDCate = ${IDCate}`);
        if(list)
            return list[0];
        return list;
    },
    findById: async (catId)=>{
        const list=await db('category').where('IDCate',catId);
        if(list)
            return list[0];
        return null;
    },
    findTopic: async(topicId,catId)=>{
        const topic=await db('topic').where({'IDTopic': topicId, 'IDCate': catId});
        console.log(topic);
    },
    add:(newCategory)=>{
        return db('category').insert(newCategory);
    },
    del:(catId)=>{
        return db('category').where('IDCate',catId).del();
    },
    patch:(category)=>{
        const catId=category.IDCate;
        delete category.IDCate;
        return db('category').where('IDCate',catId).update(category);
    },
    addtopic:(newtopic)=>{
        
        return db('topic').insert(newtopic);
    }
    
}