import db from '../utils/db.js';

//full text search setup
await db.raw(`ALTER TABLE courses ADD FULLTEXT(Name, FullDesc, TinyDesc)`)
await db.raw(`ALTER TABLE Topic ADD FULLTEXT(Name)`)
await db.raw(`ALTER TABLE category ADD FULLTEXT(Name)`)

export default{
    searchByName: async(key)=>{
        const list = await db.raw(`SELECT c.ID FROM courses c WHERE MATCH (c.Name, c.FullDesc, c.TinyDesc) AGAINST ('${key}' IN BOOLEAN MODE)`)
        if(list)
            return list[0];
        return null;
    },
    searchByCat: async(key)=>{
        const list = await db.raw(`SELECT c.ID
        FROM courses c LEFT JOIN category cat on cat.IDCate = c.IDCategory LEFT JOIN Topic t on c.Topic = t.IDTopic AND t.IDCate = cat.IDCate
        WHERE MATCH (cat.Name) AGAINST ('${key}' IN BOOLEAN MODE) OR MATCH (t.Name) AGAINST ('${key}' IN BOOLEAN MODE)`)
        if(list)
            return list[0];
        return null;
    },
    searchBothNameAndCat: async(key)=>{
        const list = await db.raw(`SELECT c.ID 
        FROM courses c LEFT JOIN category cat on cat.IDCate = c.IDCategory LEFT JOIN Topic t on c.Topic = t.IDTopic AND t.IDCate = cat.IDCate
        WHERE MATCH (c.Name, c.FullDesc, c.TinyDesc) AGAINST ('${key}' IN BOOLEAN MODE)
        OR MATCH (cat.Name) AGAINST ('${key}' IN BOOLEAN MODE)
        OR MATCH (t.Name) AGAINST ('${key}' IN BOOLEAN MODE)`)
        if(list)
            return list[0];
        return null;
    },

}