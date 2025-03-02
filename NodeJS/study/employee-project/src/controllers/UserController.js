const User = require('../models/userModel');
const bcrypt = require('bcrypt');

class UserController {
    async getAllUsers(req, res) {
        try {
            const result = await User.getUsers();
            res.status(201).json(result);
        } catch (error) {
            res.status(500).json({ message: error.message });   
        }
    }

    async createUser(req, res) {
        try {
            const result = await User.createUser(req.body);
            res.status(201).json(result);
        } catch (error) {
            res.status(500).json({ message: error.message });   
        }
    }
}

module.exports = new UserController;