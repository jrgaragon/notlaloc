const express = require('express');
const User = require('../models/user');
const app = express();


app.get('/users', (err, response) => {
    User.findAll().then(users => {
        response.json({status: 'ok', count: users.length, users});
    }, (err) => {
        response.json({status: 'error', error: err});
    });
});

module.exports = app;
