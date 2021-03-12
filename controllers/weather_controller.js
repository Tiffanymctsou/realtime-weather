require('dotenv').config();
const CronJob = require('cron').CronJob;
const axios = require('axios');
const jwt = require("jsonwebtoken");
const { API_KEY } = process.env;
const secret = process.env.JWT_SECRET;
const uri = 'https://opendata.cwb.gov.tw/api/v1/rest/datastore/O-A0003-001';
const stations = '%E7%AB%B9%E5%AD%90%E6%B9%96,%E8%87%BA%E5%8C%97,%E9%9E%8D%E9%83%A8,%E6%9D%BF%E6%A9%8B,%E6%B7%A1%E6%B0%B4,%E6%96%B0%E5%B1%8B';
const Weather = require('../models/weather_model');

// Update weather data in database
const updateWeather = new CronJob('0 0 * * * *', async function() {
    const data = await axios.get(`${uri}?Authorization=${API_KEY}&locationName=${stations}`);
    const location = data.data.records.location;
    for (let i = 0; i < location.length; i++) {
        const weatherInfo = {
            station_id: location[i].stationId
        };
        const elements = location[i].weatherElement; 
        elements.forEach(element => {
            weatherInfo[element.elementName] = element.elementValue;
        });
        
        const result = await Weather.updateWeather(weatherInfo);
        console.log(result);
    }
}, null, true, 'Asia/Taipei');

const getWeather = async (req, res) => {
    if (!req.header('Authorization')) {
        res.status(401).send('API key required!');
        return;
    }
    const key = req.header('Authorization').replace('Bearer ', '');
    jwt.verify(key, secret, (error) => {
        if (error) {
            res.status(403).send(error.message);
            return;
        }
    });
    const { locationName, city, dist } = req.query;
    const weatherInfo = await Weather.getWeather(locationName, city, dist);
    res.status(200).send(weatherInfo);
};

module.exports = {
    getWeather
};