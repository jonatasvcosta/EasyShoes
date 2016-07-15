var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
    res.render('index', { title: 'Express' });
});

router.get('/create_product', function(req, res, next) {
  res.render('create_product');
});

module.exports = router;