const router = require('express').Router();
const wrapAsync = require('../util/util');

const { getWeather } = require('../controllers/weather_controller');

router.route('/realtimeWeather').get(wrapAsync(getWeather));

module.exports = router;