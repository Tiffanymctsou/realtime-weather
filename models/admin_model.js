const { query } = require('./mysqlcon');

const generateAuth = async (key) => {
    try {
        await query('START TRANSACTION');
        const sqlQuery = 'INSERT INTO auth SET ?';
        await query(sqlQuery, key);
        await query('COMMIT');
        return { message: 'activated.' };
    } catch (error) {
        await query('ROLLBACK');
        return { error };
    }
};

const verifyKey = async (key) => {
    try {
        const sqlQuery = 'SELECT * FROM auth WHERE auth_key = ? AND status = 1';
        const result = await query(sqlQuery, key);
        return result;
    } catch (error) {
        return { error };
    }
};

module.exports = {
    generateAuth,
    verifyKey
};