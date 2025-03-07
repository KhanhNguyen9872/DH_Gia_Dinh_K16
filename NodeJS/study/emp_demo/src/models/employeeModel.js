const pool = require('../utils/connectDB');

const getAllEmployees = async () => {
    const sql = 'SELECT * FROM EMPLOYEE';
    const [rows, fields] = await pool.execute(sql);
    return rows;
};

module.exports = {
    getAllEmployees
};
