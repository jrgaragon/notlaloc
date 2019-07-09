const express = require('express');
const app = express();

app.get('/users', (err, response) => {
    console.log('get users');

    response.json({
        status:200,
        users: [
            {
                id: 1,
                name: 'test',
            },
            {
                id: 2,
                name: 'test dos',
            }
        ],
        count: 2
    });     
});

module.exports = app;