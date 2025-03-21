const Dog = require('../models/Dog');

class DogController {
    static async getRandomDog(req, res) {
        try {
            const imageURL = await Dog.getRandomDogImage();
            res.json({ message: imageURL, status: "success" }); // Trả về JSON chứa URL ảnh
        } catch (error) {
            res.status(500).json({ error: 'Không thể lấy ảnh chó' });
        }
    }
}

module.exports = DogController;