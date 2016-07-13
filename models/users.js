var User = require("../classes/User");

var autenticate = function (email, password) {
    var user = new User('','','', '', email, password, '');
    user.autenticate();
    return 200;
};

module.exports = {
    autenticate: autenticate
};