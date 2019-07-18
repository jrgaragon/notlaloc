const express = require('express');
const User = require('../models/user');
const userService = require('./login');
const router = express();


router.get('/users', (request, response) => {
    User.findAll().then(users => {
        response.json({status: 'ok', count: users.length, users});
    }, (err) => {
        response.status(500).json({status: 'error', error: err});
    });
});

// router.post('/authenticate', authenticate);

router.post('/authenticate', (request, response, next) => {
    userService.authenticate(request.body).then(user => user ? response.json(user) : 
        response.status(400).json({message: 'Username or password is incorrect'})).catch(err => next(err));
});

router.post('/testing', (request, response, next) => {
    response.json({status: 'ok'});
});


module.exports = router;
