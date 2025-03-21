const LichAm = require('../models/LichAm');

class LichAmController {
    static async convertToLunar(req, res) {
        const { day, month, year } = req.body;

        if (!day || !month || !year) {
            return res.status(400).json({ error: 'Thiếu tham số day, month hoặc year' });
        }

        try {
            const lunarData = await LichAm.getLunarDate(day, month, year);
            res.json(lunarData);
        } catch (error) {
            if (error.response) {
                res.status(error.response.status).json(error.response.data);
            } else {
                res.status(500).json({ error: 'Không thể chuyển đổi ngày' });
            }
        }
    }
}

module.exports = LichAmController;