const pool = require('../utils/connectDB');

const getAll = async () => {
    const sql = 'SELECT * FROM user';
    const [rows, fields] = await pool.execute(sql);
    return rows;
};

const create = async (newUser) => {
    const { username, password, email } = newUser;
    const sql = `
        INSERT INTO USER (USERNAME, PASSWORD, EMAIL)
        VALUES (?, ?, ?)
        `;
    await pool.execute(sql, [username, password, email]);
}

const getUser = async (username) => {
    const sql = 'SELECT * FROM user WHERE USERNAME = ?';
    const [rows, fields] = await pool.execute(sql, [username]);
    return rows;
}

const updateUser = async(newUser) => {
    const { username, password, email } = newUser;
    const sql = `
        UPDATE USER
        SET PASSWORD = ?, EMAIL = ?
        WHERE USERNAME = ?
        `;
    await pool.execute(sql, [password, email, username]);
}

module.exports = {
    getAll, create, getUser,updateUser
};
