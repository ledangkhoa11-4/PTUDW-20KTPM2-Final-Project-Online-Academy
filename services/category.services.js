import database from '../utils/db.js';
import db from '../utils/db.js';

export default{
    getMostTopicLearned: async(limit)=>{
        const list = await db.raw(`SELECT cat.IDCate, cat.Name as CatName, t.IDTopic, t.Name as TopicName
                                    FROM topic t LEFT JOIN courses c on c.Topic = t.IDTopic and c.IDCategory = t.IDCate LEFT JOIN category cat on cat.IDCate = t.IDCate LEFT JOIN 
                                    (Select p.IDCourse as ID, COUNT(p.IDCourse) as learnerCount FROM participate p GROUP BY p.IDCourse) as k on k.ID = c.ID
                                    Group by cat.IDCate, t.IDTopic
                                    ORDER BY sum(learnerCount) desc
                                    LIMIT ${limit} OFFSET 0`);
        if(list)
            return list[0];
        return list;
    },
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
        const topic=await db.raw(`Select * from topic t where t.IDCate=${catId} and t.IDTopic=${topicId}`);
        if(topic){
            return topic[0][0];
        }
        return null;
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
    },
    delTopic:(catId,topicId)=>{
        return db('topic').where('IDTopic', topicId).andWhere( 'IDCate', catId).del();
    },
    patchTopic:(topic)=>{
        const catId=topic.IDCate;
        const topicId=topic.IDTopic;
        delete topic.IDCate;
        delete topic.IDTopic;
        return db('topic').where('IDTopic', topicId).andWhere( 'IDCate', catId).update(topic);
    },
    isCatexistCourses:async (catId)=>{
        let check=0;
        const ret=await db('courses').where('IDCategory',catId);
        if(ret){
            check=1;
        }
        return check;
    },
    isTopicexistCourses:async (catId,topicId)=>{
        let check=0;
        const ret=await db('courses').where('Topic', topicId).andWhere( 'IDCategory', catId);
        if(ret.length>0){
            check=1
        }
        return  check;
    }
    
}