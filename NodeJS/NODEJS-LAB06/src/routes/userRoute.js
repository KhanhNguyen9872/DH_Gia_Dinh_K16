const express = require('express');
const router = express.Router();
const userController = require('../controllers/UserController');

// [Get] localhost:3000/users | lấy thông tin tất cả user
router.get('/', userController.getAllUsers);
// [Post] localhost:3000/users | tạo mới user
router.post('/',userController.createUser);
// [Post] localhost:3000/users/login | đăng nhập
router.post('/login', userController.login);
module.exports = router;