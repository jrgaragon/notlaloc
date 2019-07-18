require('./config/config');
const express = require('express');
const bodyParser = require('body-parser');
const errorHandler = require('../server/_helpers/error-handler');
const jwt = require('../server/_helpers/jwt');

const server = express();
server.use(jwt());

server.use(bodyParser.urlencoded({ extended: false }));
server.use(bodyParser.json());

server.use(require('./routes/users'));
// server.use(require('./routes/login'));
server.use(errorHandler);

server.listen(5000, ()=> {
    console.log('listening at port', 5000)
});