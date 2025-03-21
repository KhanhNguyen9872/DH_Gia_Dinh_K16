require('dotenv').config();
const Weather = require('../models/Weather');

class WeatherController {
    static async getWeather(req, res) {
        const cityName = 'Ho Chi Minh';
        if (!cityName) {
            return res.status(500).json({ error: 'City name is not configured' });
        }
        const units = req.query.units || 'metric';

        try {
            const weatherData = await Weather.getWeather(cityName, units);
            res.json(weatherData);
        } catch (error) {
            if (error.response) {
                res.status(error.response.status).json(error.response.data);
            } else if (error.request) {
                res.status(500).json({ error: 'No response from weather API' });
            } else {
                res.status(500).json({ error: 'Error setting up the request' });
            }
        }
    }
}

module.exports = WeatherController;