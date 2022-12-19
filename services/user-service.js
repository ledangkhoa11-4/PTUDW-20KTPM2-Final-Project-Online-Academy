import db from '../utils/db.js';

export default{
    findUserById:async(userId)=>{
        const list =await db('user').where('IDUser',userId);
        if(list)
            return list[0];
        return null;
    },
    getAllUserByRole:async(role)=>{
        const list= await db('user').where('Role',role);
        if(list)
            return list;
        return null;
    },
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
    },
    getUserByEmail: async(email)=>{
        const user = await db.raw(`Select * From user u Where u.Email Like '${email}'`);
        if(user)
            return user[0]
        return user;
    },
    isVerified: async(email)=>{
        const user = await db.raw(`Select u.OTP From user u Where u.Email Like '${email}'`);
        if(user)
            return user[0][0].OTP == 0;
        return false;
    },
    verified: async(email, OTP)=>{
        const rowEffected = await db.raw(`Update user u Set u.OTP = 0 Where u.Email = '${email}' and u.OTP = ${OTP}`);
        if(rowEffected)
            return rowEffected[0];
        return 0;
    },
    del: (userId)=>{
       return db('user').where('IDUser',userId).del();
    },
    isExist:async(userId)=>{
        const list =await db('user').where('IDUser',userId);
        if(list[0])
            return true;
        return false
    }
}