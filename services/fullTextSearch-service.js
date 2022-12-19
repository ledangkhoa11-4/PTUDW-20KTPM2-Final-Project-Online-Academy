import db from '../utils/db.js';

//full text search setup
export default{
    searchByName: async(key, order1, order2, limit, offset)=>{
        const list = await db.raw(`SELECT c.ID, IFNULL(dis.PercentDiscount, 0) as actualDiscount
        FROM courses c LEFT JOIN participate p on c.ID = p.IDCourse LEFT JOIN discount dis on c.IDDiscount = dis.ID
        WHERE MATCH (c.Name, c.FullDesc, c.TinyDesc) AGAINST ('${key}' IN BOOLEAN MODE)
        GROUP BY c.ID
        ORDER BY ${order1}, ${order2}
        LIMIT ${limit} OFFSET ${offset}`)
        if(list)
            return list[0];
        return null;
    },
    searchByCat: async(key, order1, order2, limit, offset)=>{
        const list = await db.raw(`SELECT c.ID,  IFNULL(dis.PercentDiscount, 0) as actualDiscount
        FROM courses c LEFT JOIN participate p on c.ID = p.IDCourse LEFT JOIN category cat on cat.IDCate = c.IDCategory LEFT JOIN Topic t on c.Topic = t.IDTopic AND t.IDCate = cat.IDCate LEFT JOIN discount dis on c.IDDiscount = dis.ID
        WHERE MATCH (cat.Name) AGAINST ('${key}' IN BOOLEAN MODE) OR MATCH (t.Name) AGAINST ('${key}' IN BOOLEAN MODE)
        GROUP BY c.ID
        ORDER BY ${order1}, ${order2}
        LIMIT ${limit} OFFSET ${offset}`)
        if(list)
            return list[0];
        return null;
    },
    searchBothNameAndCat: async(key, order1, order2, limit, offset)=>{
        const list = await db.raw(`SELECT c.ID, IFNULL(dis.PercentDiscount, 0) as actualDiscount
        FROM courses c LEFT JOIN participate p on c.ID = p.IDCourse LEFT JOIN category cat on cat.IDCate = c.IDCategory LEFT JOIN Topic t on c.Topic = t.IDTopic AND t.IDCate = cat.IDCate LEFT JOIN discount dis on c.IDDiscount = dis.ID
        WHERE MATCH (c.Name, c.FullDesc, c.TinyDesc) AGAINST ('${key}' IN BOOLEAN MODE)
        OR MATCH (cat.Name) AGAINST ('${key}' IN BOOLEAN MODE)
        OR MATCH (t.Name) AGAINST ('${key}' IN BOOLEAN MODE)
        GROUP BY c.ID
        ORDER BY ${order1}, ${order2}
        LIMIT ${limit} OFFSET ${offset}`)
        if(list)
            return list[0];
        return null;
    },
    countSearchByName: async(key)=>{
        const list = await db.raw(`Select Count(*) as cnt From(SELECT c.ID
        FROM courses c LEFT JOIN participate p on c.ID = p.IDCourse LEFT JOIN discount dis on c.IDDiscount = dis.ID
        WHERE MATCH (c.Name, c.FullDesc, c.TinyDesc) AGAINST ('${key}' IN BOOLEAN MODE)
        GROUP BY c.ID) as tb`)
        if(list)
            return list[0][0];
        return null;
    },
    countSearchByCat: async(key)=>{
        const list = await db.raw(`Select COUNT(*) as cnt From(SELECT c.ID
        FROM courses c LEFT JOIN participate p on c.ID = p.IDCourse LEFT JOIN category cat on cat.IDCate = c.IDCategory LEFT JOIN Topic t on c.Topic = t.IDTopic AND t.IDCate = cat.IDCate LEFT JOIN discount dis on c.IDDiscount = dis.ID
        WHERE MATCH (cat.Name) AGAINST ('${key}' IN BOOLEAN MODE) OR MATCH (t.Name) AGAINST ('${key}' IN BOOLEAN MODE)
        GROUP BY c.ID) as tb`)
        if(list)
            return list[0][0];
        return null;
    },
    countSearchBothNameAndCat: async(key)=>{
        const list = await db.raw(`Select Count(*) as cnt From (SELECT c.ID
        FROM courses c LEFT JOIN participate p on c.ID = p.IDCourse LEFT JOIN category cat on cat.IDCate = c.IDCategory LEFT JOIN Topic t on c.Topic = t.IDTopic AND t.IDCate = cat.IDCate LEFT JOIN discount dis on c.IDDiscount = dis.ID
        WHERE MATCH (c.Name, c.FullDesc, c.TinyDesc) AGAINST ('${key}' IN BOOLEAN MODE)
        OR MATCH (cat.Name) AGAINST ('${key}' IN BOOLEAN MODE)
        OR MATCH (t.Name) AGAINST ('${key}' IN BOOLEAN MODE)
        GROUP BY c.ID) as tb`)
        if(list)
            return list[0][0];
        return null;
    },
}