const Sequelize = require('sequelize');

const sequelize = new Sequelize(process.env.database, process.env.user, process.env.password, {
    host: process.env.URLDB,
    dialect: 'mysql'
});

module.exports = sequelize;