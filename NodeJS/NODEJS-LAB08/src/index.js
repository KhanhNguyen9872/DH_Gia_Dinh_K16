require('dotenv').config();
const express = require('express');
const weatherRoutes = require('./routes/weatherRoutes');
const dogRoutes = require('./routes/dogRoutes');
const lichAmRoutes = require('./routes/lichAmRoutes');

const app = express();
const PORT = process.env.EXPRESS_PORT || 3333;
app.use(express.json());

app.use('/api/weather', weatherRoutes);
app.use('/api/dog', dogRoutes);
app.use('/api/licham', lichAmRoutes);

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});