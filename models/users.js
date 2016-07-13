var User = require("../classes/User");

var autenticate = function (email, password) {
    var user = new User('1','supervisor','Lucas Amorim Silva', 42380853886, email, password, '{"casa": "Av. Frei Inácio"}');
    return user;
};

module.exports = {
    autenticate: autenticate
};