import db from "../utils/db.js";

export default {
    addChapter: async(idcourse, idchapter, name)=>{
        const result = await db.raw(`INSERT INTO chapter VALUES ('${idcourse}', '${idchapter}', '${name}')`);
        return result[0];
    },
    removeAllChapterOfCourse: async(IDCourse)=>{
        const result = await db('chapter').where({IDCourse}).del();
        return result[0];
    }
}