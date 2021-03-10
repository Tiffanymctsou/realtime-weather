const mysql = require('mysql');
const { promisify } = require('util');
const { LOCAL_DB_HOST, LOCAL_DB_USER, LOCAL_DB_PWD, LOCAL_DB } = process.env;

const mysqlConfig = {
    connectionLimit : 10,
    host: LOCAL_DB_HOST,
    user: LOCAL_DB_USER,
    password: LOCAL_DB_PWD,
    database: LOCAL_DB
};

const pool = mysql.createPool(mysqlConfig);
const promiseQuery = promisify(pool.query).bind(pool);
const promisePoolEnd = promisify(pool.end).bind(pool);

pool.on('acquire', function (connection) {
    console.log('Connection %d acquired', connection.threadId);
});

pool.on('release', function (connection) {
    console.log('Connection %d released', connection.threadId);
});

module.exports = {
    pool: pool,
    query: promiseQuery,
    end: promisePoolEnd
};