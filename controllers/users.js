var express = require('express');
var router = express.Router();

var user_model = require('../models/users');

router.get('/', function(req, res, next) {
    if(req.session.id_usuario !== 'undefined' && req.session.id_usuario){
        console.log('Usuário não logado!');
    }
    else{
        console.log('Usuário logado! Parabéns, Lucas');
    }
    res.send('respond with a resource');
});

router.get('/login', function(req, res) {
    res.render('index')
});

router.post('/signin', function(req, res, next) {
    var session = req.session;
    var email = req.body.email, password = req.body.password;

    /* usuário com id_usuario já está logado, logo vai para a home */
    if(session.id_usuario != null) res.redirect('/susers');
    var status_session = user_model.autenticate(email, password);
    session.id_usuario = (status_session != null) ? status_session : null;
    res.redirect('/users');
});

router.get('/signup', function(req, res, next) {
    res.render('signup');
});

router.post('/create_user', function(req, res, next) {
    var name = req.body.name, cpf = req.body.cpf, rg = req.body.rg, password = req.body.password1,
        confirm_password = req.body.password2, email = req.body.email, adress = req.body.adress,
        adress2 = req.body.adress2, adress3 = req.body.adress3;
        res.send(user_model.create_user('supervisor',name, cpf, rg, password, email, adress+";"+adress2+";"+adress3));
});
module.exports = router;