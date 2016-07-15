var express = require('express');
var router = express.Router();

var user_model = require('../models/users');

router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

router.get('/login', function(req, res) {
    res.render('index')
});

router.post('/signin', function(req, res, next) {
    var email = req.body.email, password = req.body.password;
    res.send(user_model.autenticate(email, password));
});

router.get('/signup', function(req, res, next) {
    res.render('signup');
});

router.post('/create_user', function(req, res, next) {
    var name = req.body.name, cpf = req.body.cpf, rg = req.body.rg, password = req.body.password1,
        confirm_password = req.body.password2, email = req.body.email, adress = req.body.adress;
    res.send(user_model.create_user('usuario', name, cpf, rg, password, email, adress));
});
module.exports = router;