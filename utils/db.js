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

// /*TEST HOSTING DATABASE */ //trên Filess.io
// const database = knex({
// 	client: 'mysql',
// 	connection: {
// 		host: 'qa1.h.filess.io',
// 		port: 3306,
// 		user: 'udemall_grouppage',
// 		password: '795b2d3b0c07fa28aa71704e4710ebc37329466f',
// 		database: 'udemall_grouppage',
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