const express = require('express');
const LichAmController = require('../controllers/LichAmController');

const router = express.Router();

router.post('/', LichAmController.convertToLunar);

module.exports = router;