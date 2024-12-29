const express = require("express");
const app = express();
const port = 3000;
app.get('/', function (req, res) {
    res.send("<h2>This is my first app</h2>");
    // res.send("Hello World");
})
app.listen(port, function () {
    console.log("Your app running on port " + port);
});
