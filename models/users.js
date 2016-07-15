var User = require("../classes/User");

var autenticate = function (email, password) {
    var user = new User('','','', '', email, password, '');
    user.autenticate();
    return 200;
};

var create_user = function (type, name, cpf, rg, password, email, adress) {
    var user = new User('',type, name,cpf,email, password, adress);
    user.create();
    return 200;
};

module.exports = {
    autenticate: autenticate,
    create_user: create_user
};