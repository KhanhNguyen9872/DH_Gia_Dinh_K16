const axios = require('axios');
const BASE_URL = 'https://jsonplaceholder.typicode.com/posts';

// New function to get a single post by ID
const getPosts = async () => {
    try {
        const response = await axios.get(`${BASE_URL}`);
        return response.data;
    } catch (error) {
        console.error(`Error fetching post:`, error.message);
        throw error;
    }
}

const getDetailPost = async(id) => {
    try {
        const response = await axios.get(`${BASE_URL}/${id}`);
        return response.data;
    } catch (error) {
        console.error(`Error fetching post ${id}:`, error.message);
        throw error;
    }
}

module.exports = {
    getPosts,
    getDetailPost, 
}