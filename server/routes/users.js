const express = require('express');
const User = require('../models/user');
const app = express();


app.get('/users', (request, response) => {
    User.findAll().then(users => {
        response.json({status: 'ok', count: users.length, users});
    }, (err) => {
        response.status(500).json({status: 'error', error: err});
    });
});

module.exports = app;
