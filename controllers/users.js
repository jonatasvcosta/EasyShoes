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
module.exports = router;
