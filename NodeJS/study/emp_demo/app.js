const express = require('express');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
const path = require('path');
const cors = require('cors');
const dotenv = require('dotenv');
dotenv.config();
const port = 3000 || process.env.PORT;
const app = express();
app.use(cors());
const auth = require('./src/utils/auth');
const morgan = require('morgan');
app.use(morgan('combined'));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cookieParser());

app.set('view engine', 'pug');
app.set('views', './src/views');

app.use((req, res, next) => {
    console.log('time: ', Date.now());
    console.log('request type:', req.method);
    console.log('request url:', req.originalUrl);
    next();
})


const exampleAxios = require('./src/utils/exAxios');
exampleAxios.getPosts();

app.use(express.static(path.join(__dirname, 'public')));

const authRouter = require('./src/routes/authRoute');
app.use('/auth', authRouter);

const employeeRouter = require('./src/routes/employeeRoute');
app.use('/employees', employeeRouter);

const productRouter = require('./src/routes/productRoute');
app.use('/products', productRouter);


app.get('/', (req, res) => {
    return res.render('index');
});

app.get('/about', (req, res) => {
    res.render('info/about');
});

// Middleware xử lý lỗi 404: Khi không có route nào khớp
app.use((req, res, next) => {
    console.log('404 middleware hit');
    res.status(404).render('error404');
  });

app.listen(port, () => {
    console.log(`App listening at http://localhost:${port}`);
});