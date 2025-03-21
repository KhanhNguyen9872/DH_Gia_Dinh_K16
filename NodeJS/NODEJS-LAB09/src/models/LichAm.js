const axios = require('axios');

class LichAm {
    static async getLunarDate(day, month, year) {
        const API_URL = 'https://open.oapi.vn/date/convert-to-lunar';
        try {
            const response = await axios.post(API_URL, {
                day: day,
                month: month,
                year: year
            }, {
                headers: {
                    'Content-Type': 'application/json'
                }
            });
            return response.data;
        } catch (error) {
            throw error;
        }
    }
}

module.exports = LichAm;