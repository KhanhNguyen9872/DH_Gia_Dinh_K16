const router = require('express').Router();
const bookController = require('../controllers/bookController');

router.get('/', bookController.getAllBooks);
router.post('/', bookController.createBook);
router.delete('/:id', bookController.deleteBook);
router.put('/:id', bookController.updateBook);
router.get('/:id', bookController.getBookById);
router.post('/:name', bookController.searchBookByName);

module.exports = router;