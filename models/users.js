var autenticate = function (email, password) {
    if(email == "admin@admin" && password == "admin") return "sucesso";
    return "fracasso";
};

module.exports = {
  autenticate: autenticate
};