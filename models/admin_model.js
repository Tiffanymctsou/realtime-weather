const { query } = require('./mysqlcon');

const generateAuth = async (key) => {
    try {
        await query('START TRANSACTION');
        const sqlQuery = 'INSERT INTO api_key SET ?';
        await query(sqlQuery, key);
        await query('COMMIT');
        return { message: 'activated.' };
    } catch (error) {
        await query('ROLLBACK');
        return { error };
    }
};

module.exports = {
    generateAuth
};