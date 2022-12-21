import knex from 'knex';

/* -------------------------------------------------- */
const database = knex({
	client: 'mysql',
	connection: {
		host: '127.0.0.1',
		port: 3306,
		user: 'root',
		password: '',
		database: 'academy',
	},
	pool: {
		min: 0,
		max: 10,
	},
});

try {
	await database.raw('select 1+1 as result');
} catch (err) {
	console.log(err.stack);
	process.exit(-1);
}

export default database;

/*TEST HOSTING DATABASE */ //trên clever clound
// const database = knex({
// 	client: 'mysql',
// 	connection: {
// 		host: 'blje6shixeokdbenq3et-mysql.services.clever-cloud.com',
// 		port: 3306,
// 		user: 'ugudpok78vbce96x',
// 		password: '20NmQKwynRHjd9zirIkv',
// 		database: 'blje6shixeokdbenq3et',
// 	},
// 	pool: {
// 		min: 0,
// 		max: 10,
// 	},
// });

// try {
// 	await database.raw('select 1+1 as result');
// } catch (err) {
// 	console.log(err.stack);
// 	process.exit(-1);
// }

// export default database;