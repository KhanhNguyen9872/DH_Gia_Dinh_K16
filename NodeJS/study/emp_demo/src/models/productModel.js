const pool = require('../utils/connectDB');

const getAllProducts = async () => {
    const sql = 'SELECT * FROM product';
    const [rows, fields] = await pool.execute(sql);
    return rows;
}

module.exports = {
    getAllProducts
};