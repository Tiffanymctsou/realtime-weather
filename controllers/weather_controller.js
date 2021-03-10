require('dotenv').config();
const CronJob = require('cron').CronJob;
const axios = require('axios');
const { API_KEY } = process.env;
const uri = 'https://opendata.cwb.gov.tw/api/v1/rest/datastore/O-A0003-001';
const stations = '%E7%AB%B9%E5%AD%90%E6%B9%96,%E8%87%BA%E5%8C%97,%E9%9E%8D%E9%83%A8,%E6%9D%BF%E6%A9%8B,%E6%B7%A1%E6%B0%B4,%E6%96%B0%E5%B1%8B';
const Weather = require('../models/weather_model');
const Admin = require('../models/admin_model');

// Update weather data in database
const updateWeather = new CronJob('0 0 * * * *', async function() {
    const data = await axios.get(`${uri}?Authorization=${API_KEY}&locationName=${stations}`);
    const location = data.data.records.location;
    for (let i = 0; i < location.length; i++) {
        const element = location[i].weatherElement; 
        const weatherInfo = {
            station_id: location[i].stationId,
            height: element[0].elementValue,
            wind_direction: element[1].elementValue,
            wind_speed: element[2].elementValue,
            temp: element[3].elementValue,
            humidity: element[4].elementValue,
            pressure: element[5].elementValue,
            daily_rain: element[6].elementValue,
            wind_speed_max: element[7].elementValue,
            wind_direction_max: element[8].elementValue,
            max_wind_time: element[9].elementValue,
            wind_speed_max_10: element[10].elementValue,
            wind_direction_max_10: element[11].elementValue,
            max_wind_time_10: element[12].elementValue,
            UV_index: element[13].elementValue,
            max_temp: element[14].elementValue,
            max_temp_time: element[15].elementValue,
            min_temp: element[16].elementValue,
            min_temp_time: element[17].elementValue,
            total_sun_time: element[18].elementValue,
            visible_distance: element[19].elementValue,
            weather: element[20].elementValue,
        };

        const result = await Weather.updateWeather(weatherInfo);
        console.log(result);
    }
}, null, true, 'Asia/Taipei');

const getWeather = async (req, res) => {
    const key = req.query.Authorization;
    if (!key) {
        res.status(401).send('API key required!');
        return;
    }
    const result = await Admin.verifyKey(key);
    if (result.length === 0) {
        res.status(401).send('Invalid API key!');
        return;
    }
    const { locationName, city, dist } = req.query;
    const weatherInfo = await Weather.getWeather(locationName, city, dist);
    res.status(200).send(weatherInfo);
};

module.exports = {
    getWeather
};