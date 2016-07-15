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

User.prototype.create = function (){
        var connection = connection_model.connect();
        multiple_adresses = this.addresses.split(";");
        var json_adress = new Object();
        json_adress.adress_1 = multiple_adresses[0];
        json_adress.adress_2 = multiple_adresses[1];
        json_adress.adress_3 = multiple_adresses[2];

        var query = "insert into usuario (tipo_usuario, nome_completo, cpf, email, senha, endereco, data_hora_criacao) values('"+this.type+"','"+this.name+"',"+this.cpf+", '"+this.email+"', '"+this.password+"','"+JSON.stringify(json_adress)+"', now());";
        connection.query(query, function(err, rows, fields){
            console.log(query);
            console.log('****************');
            console.log(fields);
            console.log('################');
            console.log(rows);
        });
    };

module.exports = User;