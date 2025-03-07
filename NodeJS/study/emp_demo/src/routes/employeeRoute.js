const express = require('express');
const router = express.Router();
const employeeController = require('../controllers/EmployeeController');
const auth = require('../utils/auth');
// [GET] localhost:3000/employees
router.get('/' , employeeController.getAllEmployees);

module.exports = router;