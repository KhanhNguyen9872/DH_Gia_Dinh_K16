const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const dotenv = require('dotenv');
dotenv.config();
const app = express();
const port = process.env.PORT;

app.set('view engine', 'pug');
app.set('views', './src/views');
app.use(express.static(path.join(__dirname, 'public')));
const morgan = require('morgan');
app.use(bodyParser.urlencoded({ extended: true }));

app.use(morgan('combined'));

const connectDB = require('./src/utils/connectDB');
connectDB();

const bookRoute = require('./src/routers/bookRoute');
app.use('/api/books', bookRoute);

app.get('/', (req, res) => {
    res.render('index.pug');
});

// Middleware xử lý lỗi 404: Khi không có route nào khớp
app.use((req, res, next) => {
    console.log('404 middleware hit');
    res.status(404).render('error404');
  });


app.listen(port, () => {
    console.log(`App listening at http://localhost:${port}`);
});
