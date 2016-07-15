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
module.exports = router;    
