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

const getWeather = async (location, city, dist) => {
    try {
        if (!location) {
            location = '';
        }
        if (!city) {
            city = '';
        }
        if (!dist) {
            dist = '';
        }
        let sqlQuery = `SELECT w.* FROM weather w INNER JOIN location l ON w.station_id = l.station_id
        WHERE location_name LIKE CONCAT(?, '%') AND city LIKE CONCAT(?, '%') AND dist LIKE CONCAT(?, '%')`;
        const result = await query(sqlQuery, [location, city, dist]);
        return result;
    } catch (error) {
        return { error };
    }
};

module.exports = {
    updateWeather,
    getWeather
};