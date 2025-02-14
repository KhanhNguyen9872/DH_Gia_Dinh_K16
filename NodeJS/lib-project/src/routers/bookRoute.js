const router = require('express').Router();
const bookController = require('../controllers/bookController');

router.get('/', bookController.getAllBooks);
router.post('/', bookController.createBook);
router.delete('/:id', bookController.deleteBook);
router.put('/:id', bookController.updateBook);

module.exports = router;