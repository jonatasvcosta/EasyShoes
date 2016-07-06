var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

router.get('/login', function(req, res) {
    res.render('index')
});

router.post('/criar_conta', function () {
     
});

module.exports = router;
