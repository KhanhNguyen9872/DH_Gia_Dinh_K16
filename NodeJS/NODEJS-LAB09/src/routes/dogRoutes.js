const express = require('express');
const DogController = require('../controllers/DogController');

const router = express.Router();

router.get('/', DogController.getRandomDog);

module.exports = router;