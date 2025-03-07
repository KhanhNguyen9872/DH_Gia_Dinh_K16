const { model } = require('mongoose');
const auth = require('../utils/auth');
const checkAuth = (req, res, next) => {
    // const token = req.headers.authorization?.split(' ')[1];
    const token = req.cookies.accessToken;
    const checkUser = auth.verifyAccessToken(token);
    if (!checkUser) {
        return res.status(403).json("Chưa đăng nhập");
    }

    req.user = checkUser;
    next();
}

module.exports = {
    checkAuth
}