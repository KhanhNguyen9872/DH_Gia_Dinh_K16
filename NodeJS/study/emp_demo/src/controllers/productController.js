const auth = require('../utils/auth');
const product = require('../models/productModel');
class ProductController {
    async getAllProducts(req, res) {
        const products = await product.getAllProducts();
        console.log(req.user);
        res.render('products/product', { products });

    }
}

module.exports = new ProductController();