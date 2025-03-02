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
};
const checkUser = async(username) =>{
    const query = `SELECT * FROM user WHERE USERNAME = ?`;
    const [rows, fields] = await pool.execute(query, [username]);
    return rows[0];
}
const login = async (user) =>{
    const {username, password} = user;
    const query = `SELECT * FROM user WHERE USERNAME = ? AND PASSWORD = ?`;
    const [rows, fields] = await pool.execute(query, [username, password]);
    return rows[0];
}
module.exports = {
    getAllUsers,
    createUser,
    checkUser
};
