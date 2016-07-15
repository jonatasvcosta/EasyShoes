function User(id, type, name, cpf, email, password, addresses){
    this.id = id;
    this.type = type;
    this.name = name;
    this.cpf = cpf;
    this.email = email;
    this.password = password;
    this.addresses = addresses;
};

var connection_model = require('../models/connection');

User.prototype.autenticate = function () {
    var connection = connection_model.connect();
    var query = 'select id_usuario, tipo_usuario, nome_completo, cpf, email, senha, endereco from usuario where email="'+this.email+'" and senha ="'+this.password+'"'
    connection.query(query, function(err, rows, fields){
        if(err){
            console.log(err);
            throw err;
        }
        /* TODO: tirar essas linhas quando estiver tudo ok na conexão */
        console.log('################');
        if(rows[0].id_usuario !== 'undefined' && rows[0].id_usuario) {
            console.log(rows[0].id_usuario);
            return rows[0].id_usuario;
        }
        return null;
    });
};

module.exports = User;