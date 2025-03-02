const employeeModel = require('../models/employeeModel');

class EmployeeController {
    async getAll(req, res) {
        try {
            const employees = await employeeModel.getAllEmployees();
            return res.status(200).json(employees);
        } catch (error) {
            console.error('Error fetching employees:', error);
            return res.status(500).json({ message: 'Internal server error' });
        }
    }

    async getById(req, res) {
        try {
            const { id } = req.params;
            const rows = await employeeModel.getEmployeeById(id);

            if (rows.length === 0) {
                return res.status(404).json({ message: 'Employee not found' });
            }
            return res.status(200).json(rows[0]);
        } catch (error) {
            console.error('Error fetching employee:', error);
            return res.status(500).json({ message: 'Internal server error' });
        }
    }

    async create(req, res) {
        try {
            const newEmployeeData = req.body;
            const insertId = await employeeModel.createEmployee(newEmployeeData);
            return res.status(201).json({
                message: 'Employee created successfully',
                employeeId: insertId
            });
        } catch (error) {
            console.error('Error creating employee:', error);
            return res.status(500).json({ message: 'Internal server error' });
        }
    }

    async update(req, res) {
        try {
            const { id } = req.params;
            const updatedData = req.body;

            const affectedRows = await employeeModel.updateEmployee(id, updatedData);
            if (affectedRows === 0) {
                return res.status(404).json({ message: 'Employee not found or no changes made' });
            }
            return res.status(200).json({ message: 'Employee updated successfully' });
        } catch (error) {
            console.error('Error updating employee:', error);
            return res.status(500).json({ message: 'Internal server error' });
        }
    }

    async delete(req, res) {
        try {
            const { id } = req.params;
            const affectedRows = await employeeModel.deleteEmployee(id);

            if (affectedRows === 0) {
                return res.status(404).json({ message: 'Employee not found' });
            }
            return res.status(200).json({ message: 'Employee deleted successfully' });
        } catch (error) {
            console.error('Error deleting employee:', error);
            return res.status(500).json({ message: 'Internal server error' });
        }
    }
}

module.exports = new EmployeeController();
