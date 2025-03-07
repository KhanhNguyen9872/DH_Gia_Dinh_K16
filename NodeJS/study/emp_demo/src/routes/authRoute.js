const express = require('express');
const router = express.Router();
const authController = require('../controllers/AuthController');

// [GET] localhost:3000/auth/users
router.get('/users', authController.getAllUsers);

// [POST] localhost:3000/auth/create
router.post('/create', authController.createUser);

// [POST] localhost:3000/auth/login
router.post('/login', authController.login);

// [PUT] localhost:3000/auth/update
router.put('/update', authController.updateUser);

// [GET] localhost:3000/auth/login
router.get('/login', (req, res) => {
    res.render('login');
});

module.exports = router;