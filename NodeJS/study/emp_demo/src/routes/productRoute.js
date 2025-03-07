const express = require('express');
const router = express.Router();
const productController = require('../controllers/productController');
const auth = require('../utils/auth');
const authmiddleware = require('../middlewares/middleware');

router.get('/', authmiddleware.checkAuth, productController.getAllProducts);


module.exports = router;