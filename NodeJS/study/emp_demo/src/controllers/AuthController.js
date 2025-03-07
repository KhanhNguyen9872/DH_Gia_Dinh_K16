const User = require('../models/userModel');
const bcrypt = require('bcrypt');
const auth = require('../utils/auth');

class AuthController {
    async getAllUsers(req, res) {
        try {
            const users = await User.getAll();
            res.status(200).json(users);
        } catch (error) {
            console.log(error);
            res.status(500).json(error);
        }

    }

    async createUser(req, res) {
        try {
            const newUser = req.body;
            const user = await User.getUser(newUser.username);
            if (user.length > 0) {
                return res.status(400).json("User already exists");
            }
            newUser.password = await bcrypt.hash(newUser.password, 10);
            await User.create(newUser);
            res.status(201).json("User created successfully");
        } catch (error) {
            console.log(error);
            res.status(500).json(error);
        }
    }

    async login (req, res) {
        const {username, password} = req.body;
        const user = await User.getUser(username);
        if (user.length === 0) {
            return res.redirect('/auth/login');
        }
        const isMatch = await bcrypt.compare(password, user[0].PASSWORD);
        if (!isMatch) {
            return res.redirect('/auth/login');
        }
        // đăng nhập thành công
        const currentUser = {
            username: user[0].USERNAME,
            email: user[0].EMAIL,
            role: 'member'
        }
        const accessToken = auth.generateAccessToken(currentUser);
        res.send({ accessToken: accessToken });
    }

    async updateUser(req, res) {
        try {
            const newUser = req.body;
            const user = await User.getUser(newUser.username);
            if (user.length === 0) {
                return res.status(400).json("User not found");
            }
            newUser.password = await bcrypt.hash(newUser.password, 10);
            await User.updateUser(newUser);
            res.status(200).json("User updated successfully");
        } catch (error) {
            console.log(error);
            res.status(500).json(error);
        }
    }
}

module.exports = new AuthController;