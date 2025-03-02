const pool = require('../utils/connectDB');
const getAllUsers = async () =>{
    const query = 'SELECT * FROM user';
    const [rows, fields] = await pool.execute(query);
    return rows;
};
const createUser = async (newUser) =>{
    const {username, email, password} = newUser;
    const query = `INSERT INTO user (USERNAME, EMAIL, PASSWORD) VALUES (?, ?, ?)`;
    // const [rows, fields] = await pool.execute(query, [username, email, password]);
    const result = await pool.execute(query, [username, email, password]);
    return result;
}
module.exports = {
    getAllUsers,
    createUser
};