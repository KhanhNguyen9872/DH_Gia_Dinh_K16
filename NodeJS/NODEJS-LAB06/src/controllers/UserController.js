const User = require('../models/userModel');
const bcrypt = require('bcrypt');

class UserController {
    async getAllUsers(req, res){
        try{
            const result = await User.getAllUsers();
            res.status(200).json(result);
        } catch (error){
            res.status(500).json({message: error.message});
        }
    }
    async createUser(req, res){
        try{
            const newUser = req.body;
            const temp = await User.checkUser(newUser.username);
            if (temp){
                return res.status(400).json({message: 'Username already exists'});
            }
            newUser.password = await bcrypt.hash(newUser.password, 10);
            await User.createUser(newUser);
            res.status(200).json({message: 'User created successfully'});
        } catch (error){
            res.status(500).json({message: error.message});
        }
    };
    async login(req, res){
        const {username, password} = req.body;
        try{
            const user = await User.checkUser(username);
            if (!user){
                return res.status(400).json({message: 'Username does not exist'});
            }
            const checkPassword = await bcrypt.compare(password, user.PASSWORD);
            if(!checkPassword){
                return res.status(400).json({message: 'Password is incorrect'});
            }
            res.status(200).json({message: 'Login successfully'});
        } catch (error){
            res.status(500).json({message: error.message});
        }
    }
}


module.exports = new UserController;