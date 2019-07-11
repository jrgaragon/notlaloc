require('./config/config');
const express = require('express');
const bodyParser = require('body-parser');

const server = express();

server.use(bodyParser.urlencoded({ extended: false }));
server.use(bodyParser.json());

server.use(require('./routes/users'));
server.use(require('./routes/login'));

server.listen(5000, ()=> {
    console.log('listening at port', 5000)
});