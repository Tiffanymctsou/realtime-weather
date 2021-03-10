require('dotenv').config();
// express initialisation
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const app = express();
const PORT = process.env.PORT || 8080;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded());


app.use(cors());


// API routes
app.use('/', [
    require('./routes/weather_route')
]);

app.use(function (req, res, next) {
    res.status(404).send('Page Not Found!');
});

// Error handling
app.use(function (err, req, res, next) {
    console.log(err);
    res.status(500).send('Internal Server Error');
});

app.listen(PORT, () => console.log(`Oh yes! Server is running on port ${PORT}!`));