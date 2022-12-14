import db from '../utils/db.js'

export default {
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
    },
    getTopView : async (limit)=>{
        const list = await db.raw(`SELECT c.ID from courses c ORDER BY c.Viewer DESC LIMIT ${limit} OFFSET 0`)
        if (list)
            return list[0];
        return null;
    },
    getTopNewest : async (limit)=>{
        const list = await db.raw(`SELECT c.ID from courses c ORDER BY c.CreatedTime DESC LIMIT ${limit} OFFSET 0`)
        if (list)
            return list[0];
        return null;
    },
    /**
     * info: ID, Name, TinyDesc, FullDes, CourseFee,  CatName, TopicName,  Instructor, AvgRating, CountRating, TotalLecture, TotalLength
     */
    getInfoCourse: async(IDCourse)=>{ 
        let info1 = await db.raw(`Select c.ID, cat.IDCate as IDCate, t.IDTopic as IDTopic , c.Name as Name, c.TinyDesc, c.FullDesc, c.CourseFee, d.PercentDiscount,  cat.Name as CatName, t.Name as TopicName, u.FullName as Instructor, AVG(p.Rating) as AvgRating, COUNT(p.Rating) as CountRating
        From courses c LEFT JOIN category cat on c.IDCategory = cat.IDCate LEFT JOIN topic t ON t.IDTopic = c.Topic and t.IDCate = cat.IDCate LEFT JOIN participate p ON c.ID = p.IDCourse LEFT JOIN user u ON c.IDInstructor = u.IDUser Left Join discount d on d.ID = c.IDDiscount
        WHERE c.ID = ${IDCourse}
        GROUP by c.ID, c.Name, cat.Name, c.TinyDesc, c.FullDesc, t.Name, u.FullName`);

        let info2 = await db.raw(`Select count(video.No) as TotalLecture, sum(video.Length) as TotalLength 
        From courses c LEFT JOIN circulativevideo video on c.ID = video.IDCourse
        WHERE c.ID = ${IDCourse}`
        )
        if(info2 && info1){
            info1 = info1[0][0];
            info2 = info2[0][0];
            return {...info1, ...info2}
        }  
        return null;
    }

}


