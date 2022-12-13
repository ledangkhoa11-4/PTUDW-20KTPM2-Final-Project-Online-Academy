import knex from 'knex'
const database = knex({
    client: 'mysql',
    connection: {
      host : '127.0.0.1',
      port: 3306,
      user : 'root',
      password : '',
      database : 'academy'
    }
  });

  try{
    await database.raw("select 1+1 as result");
  }catch(err){
    console.log(err.stack);
    process.exit(-1);
  }
  
  
  export default database;