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
    var query = 'select id_usuario, tipo_usuario, nome_completo, cpf, email, senha, endereco from usuario where email="'+this.email+'" and senha ="'+this.password+'"';
    connection.query(query, function(err, rows, fields){
        console.log('$$$$$$$$$$$$$$$$');
        console.log(query);
        console.log('****************');
        console.log(fields);
        console.log('################');
        console.log(rows);
    });
};

User.prototype.create = function (){
    var connection = connection_model.connect();
    var query = "insert into usuario (tipo_usuario, nome_completo, cpf, email, senha, endereco, data_hora_criacao) values('supervisor','"+this.name+"', 4, 'lucas.amorim.silva.usp@gmail.com', 'uchihasasuke', '{\"casa\":\"Av. Frei Inácio\"}', now());";
    connection.query(query, function(err, rows, fields){
        console.log('$$$$$$$$$$$$$$$$');
        console.log(query);
        console.log('****************');
        console.log(fields);
        console.log('################');
        console.log(rows);
    });
}

module.exports = User;;