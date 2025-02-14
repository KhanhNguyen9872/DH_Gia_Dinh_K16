const mongoose = require('mongoose');

const bookSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true
    },
    year: {
        type: Number,
    },
    author: {
        type: String,
    },
    description: {
        type: String,
    },
    createAt: {
        type: Date, default: Date.now
    },
    updateAt: {
        type: Date, default: Date.now
    }
});

module.exports = mongoose.model('books', bookSchema);
