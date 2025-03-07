const employee = require('../models/employeeModel');
const bcrypt = require('bcrypt');

class EmployeeController {
    async getAllEmployees(req, res) {
        try {
            const employees = await employee.getAllEmployees();
            res.status(200).render('employee', {employees});
            //res.status(200).json(employees);
        } catch (error) {
            console.log(error);
            res.status(500).json(error);
        }
    }
}

module.exports = new EmployeeController();