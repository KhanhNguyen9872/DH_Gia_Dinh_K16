const axios = require('axios');

class Weather {
    static async getWeather(city, units = 'metric') {
        const BASE_URL = 'https://api.openweathermap.org';
        const API_KEY = process.env.API_KEY;
        const url = `${BASE_URL}/data/2.5/weather?q=${city}&units=${units}&appid=${API_KEY}`;
        try {
            const response = await axios.get(url);
            return response.data;
        } catch (error) {
            throw error;
        }
    }
}

module.exports = Weather;