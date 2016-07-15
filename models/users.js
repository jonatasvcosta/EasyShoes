var User = require("../classes/User");

var autenticate = function (email, password) {
    var user = new User('','','', '', email, password, '');
    return user.autenticate();
};

module.exports = {
    autenticate: autenticate
};