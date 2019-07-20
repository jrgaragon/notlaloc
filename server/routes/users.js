const express = require('express');
const User = require('../models/user');
const userService = require('./login');
const router = express();


router.get('/getUsers', (request, response) => {
    userService.getAll().then(users => {
        response.json(users);
    }).catch(err => next(err));    
});

// router.post('/authenticate', authenticate);

router.post('/authenticate', (request, response, next) => {
    userService.authenticate(request.body).then(user => user ? response.json(user) : response.status(400).json({message: 'Username or password is incorrect'})).catch(err => next(err));
});

router.get('/noAuth', (request, response, next) => {
    response.json({status: 'ok'});
});


module.exports = router;
