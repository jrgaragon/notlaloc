const expressJwt = require('express-jwt');
const config = require('../config/config');

module.exports = jwt;

function jwt() {
    const secret = process.env.SECRETKEY;
    return expressJwt({secret: secret}).unless({
        path: [
            // public routes that don't require authentication
            '/authenticate',
            '/noAuth'
        ]
    });
}