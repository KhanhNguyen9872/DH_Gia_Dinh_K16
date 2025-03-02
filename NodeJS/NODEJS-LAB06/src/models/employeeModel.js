const pool = require('../utils/connectDB'); // or wherever your pool is defined

const getAllEmployees = async () => {
  const [rows] = await pool.execute('SELECT * FROM employee');
  return rows;
};

const getEmployeeById = async (id) => {
  const [rows] = await pool.execute(
    'SELECT * FROM employee WHERE EMP_ID = ?',
    [id]
  );
  return rows;
};

const createEmployee = async (employeeData) => {
  const {
    EMP_NAME,
    EMP_NO,
    HIRE_DATE,
    IMAGE,
    JOB,
    SALARY,
    DEPT_ID,
    MNG_ID
  } = employeeData;

  const [result] = await pool.execute(
    `INSERT INTO employee 
       (EMP_NAME, EMP_NO, HIRE_DATE, IMAGE, JOB, SALARY, DEPT_ID, MNG_ID)
     VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
    [EMP_NAME, EMP_NO, HIRE_DATE, IMAGE, JOB, SALARY, DEPT_ID, MNG_ID]
  );

  return result.insertId;
};

const updateEmployee = async (id, employeeData) => {
  const {
    EMP_NAME,
    EMP_NO,
    HIRE_DATE,
    IMAGE,
    JOB,
    SALARY,
    DEPT_ID,
    MNG_ID
  } = employeeData;

  const [result] = await pool.execute(
    `UPDATE employee
       SET EMP_NAME = ?, EMP_NO = ?, HIRE_DATE = ?, IMAGE = ?, JOB = ?, 
           SALARY = ?, DEPT_ID = ?, MNG_ID = ?
     WHERE EMP_ID = ?`,
    [EMP_NAME, EMP_NO, HIRE_DATE, IMAGE, JOB, SALARY, DEPT_ID, MNG_ID, id]
  );

  return result.affectedRows;
};

const deleteEmployee = async (id) => {
  const [result] = await pool.execute(
    'DELETE FROM employee WHERE EMP_ID = ?',
    [id]
  );
  return result.affectedRows;
};

module.exports = {
  getAllEmployees,
  getEmployeeById,
  createEmployee,
  updateEmployee,
  deleteEmployee
};
