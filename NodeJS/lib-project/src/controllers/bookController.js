const bookModel = require('../models/bookModel');

class BookController {
    async getAllBooks(req, res) {
        try {
            const books = await bookModel.find({});
            res.status(200).json(books);
        } catch (err) {
            res.status(500).send(err);
        }
    }
    async createBook(req, res) {
        try {
            const book = new bookModel(req.body);
            const newBook = await book.save();
            res.status(201).json(newBook);
        } catch (err) {
            res.status(500).send(err);
        }
    }
    async deleteBook(req, res) {
        try {
            const { id } = req.params;
            const book = await bookModel.findById(id);
            if (!book) {
                return res.status(404).send('Book not found');
            }
            const deleteBook = await bookModel.findByIdAndDelete(id);
            res.status(200).json(deleteBook);
        } catch (err) {
            res.send(500).send(err);
        }
    }
    async updateBook(req, res) {
        try {
            const { id } = req.params;
            const book = await bookModel.findById(id);
            if (!book) {
                return res.status(404).send('Book not found');
            }
            const updatedBook = await bookModel.findByIdAndUpdate(id, req.body);
            res.status(200).json(updatedBook);
        } catch (error) {
            res.status(500).send(error);
        }
    }
}

module.exports = new BookController();