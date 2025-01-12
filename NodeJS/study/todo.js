const data = require("./data.json");

const express = require('express');
const router = express.Router();

router.get("/", (req, res) => {
    res.render("data", {
        todos: data
    });
});

module.exports = router;