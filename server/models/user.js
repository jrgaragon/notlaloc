const sequelize = require('../database/dataAccessLayer');
const Sequelize = require('sequelize');

const Model = Sequelize.Model;
class User extends Model {}User.init({
    id: {
        primaryKey: true,
        type: Sequelize.INTEGER,
        allowNull: false
    },
    name: {
        type: Sequelize.STRING,
        allowNull: false
    },
    password: {
        type: Sequelize.STRING,
        allowNull: false
    },
    roleId: {
        type: Sequelize.INTEGER,
        allowNull: false
    }
}, {
    sequelize,
    modelName: 'user',
    freezeTableName: true,
    createdAt:false,
    updatedAt:false
});

module.exports = User;
