import db from '../utils/db.js';

export default{
    isEmailExists: async(email)=>{
        const list = await db.raw(`Select * From user where user.Email LiKE '${email}'`);
        if(list){
            return (list[0].length !== 0);
        }
            
        return null;
    },
    getTopicByCat: async(IDCate)=>{
        const list = await db.raw(`Select * From topic t Where t.IDCate = ${IDCate}`);
        if(list)
            return list[0]
        return list;
    },
    addUser: async(user)=>{
        return db('user').insert(
           user
        )
    }
}