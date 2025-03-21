const axios = require('axios');

class Dog {
    static async getRandomDogImage() {
        const RANDOM_DOG_URL = 'https://dog.ceo/api/breeds/image/random';
        try {
            const response = await axios.get(RANDOM_DOG_URL);
            return response.data.message; // Trả về URL ảnh
        } catch (error) {
            throw error; // Ném lỗi nếu có vấn đề
        }
    }
}

module.exports = Dog;