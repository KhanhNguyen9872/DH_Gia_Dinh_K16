var express = require('express');
var app = express();
var bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static('public'));

// Phuong thuc get() phan hoi mot GET Request ve Homepage
app.get('/', function (req, res) {
    console.log("Nhan mot GET Request ve Homepage");
    res.send('Hello GET');
})

// Phuong thuc post() phan hoi mot POST Request ve Homepage
app.post('/', function (req, res) {
    console.log("Nhan mot POST Request ve Homepage");
    res.send('Hello POST');
})

// Phuong thuc delete() phan hoi mot DELETE Request ve /del_user page.
app.delete('/del_user', function (req, res) {
    console.log("Nhan mot DELETE Request ve /del_user");
    res.send('Hello DELETE');
})

// Phuong thuc nay phan hoi mot GET Request ve /list_user page.
app.get('/list_user', function (req, res) {
    console.log("Nhan mot GET Request ve /list_user");
    res.send('Page Listing');
})

app.get('/index.html', function (req, res) {
    res.sendFile(__dirname + "/" + "index.html");
})

app.get('/process_get', function (req, res) {

    // Chuan bi output trong dinh dang JSON
    response = {
        first_name: req.query.first_name,
        last_name: req.query.last_name
    };
    console.log(response);
    res.end(JSON.stringify(response));
})


app.post('/process_post', function (req, res) {

    // Chuan bi output trong dinh dang JSON
    response = {
        first_name: req.body.first_name,
        last_name: req.body.last_name
    };
    console.log(response);
    res.end(JSON.stringify(response));
})

var server = app.listen(8081, function () {

    var host = server.address().address
    var port = server.address().port

    console.log("Ung dung Node.js dang lang nghe tai dia chi: http://%s:%s", host, port)

})