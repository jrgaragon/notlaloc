const jwt = require('jsonwebtoken');
const router = require('../routes/router.service');

// users hardcoded for simplicity, store in a db for production applications
const users = [{
        id: 1,
        username: 'test',
        password: 'test',
        firstName: 'Test',
        lastName: 'User'
    }];

module.exports = {
    authenticate,
    authorize,
    getAll
};

async function authenticate({username, password}) {
    const user = users.find(u => u.username === username && u.password === password);
    if (user) {
        const token = jwt.sign({
            userId: user.id
        }, process.env.SECRETKEY, {expiresIn: '1h'});
        const {
            password,
            ...userWithoutPassword
        } = user;
        return {
            ...userWithoutPassword,
            token
        };
    }
}

async function authorize(request, response, next) {
    let pathDoesntRequiereAuth = router.getInstance();
    let noAuthRoutes = await pathDoesntRequiereAuth.getNoAuthRoutes();
   
    let result = noAuthRoutes.filter(x => x == request.path);

    if (result && result.length == 0) {
        let token = request.headers['authorization'].split(' ')[1].trim();
        let decoded = jwt.verify(token, process.env.SECRETKEY);
        // validate roleid vs operation
                
        console.log(decoded);
        next();
    } else {
        next();
    }
}

async function getAll() {
    return users.map(u => {
        const {
            password,
            ...userWithoutPassword
        } = u;
        return userWithoutPassword;
    });
}
