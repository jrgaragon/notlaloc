const express = require('express');

const server = express();

server.use(require('./routes/users'));

server.listen(5000, ()=> {
    console.log('listening at port', 5000)
});