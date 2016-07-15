// connection module
var mysql = require('mysql');

/* returns a MySQL database connection */
var connect = function () {
    var connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'easyshoes'
    });
    return connection;
};

module.exports = {
    connect:connect
}