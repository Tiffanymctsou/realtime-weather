const { query } = require('./mysqlcon');

const updateWeather = async (info) => {
    try {
        await query('START TRANSACTION');
        const sqlQuery = 'UPDATE weather SET ? WHERE station_id = ?';
        await query(sqlQuery, [info, info.station_id]);
        await query('COMMIT');
        return { message: `${info.station_id} updated.` };
    } catch (error) {
        await query('ROLLBACK');
        return { error };
    }
};

module.exports = {
    updateWeather
};