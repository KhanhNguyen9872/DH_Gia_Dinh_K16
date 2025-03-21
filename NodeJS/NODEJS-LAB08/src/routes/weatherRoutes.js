const express = require('express');
const WeatherController = require('../controllers/WeatherController');

const router = express.Router();

router.get('/', WeatherController.getWeather);

module.exports = router;