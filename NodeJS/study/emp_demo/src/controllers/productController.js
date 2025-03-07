const auth = require('../utils/auth');
const product = require('../models/productModel');

class ProductController {
    async getAllProducts(req, res) {
        const products = await product.getAllProducts();
        console.log("AAAAAAAAAAA", req.user);
        res.render('products/product', { products, user: req.user });
    }
}

module.exports = new ProductController();