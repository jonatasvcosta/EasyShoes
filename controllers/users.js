var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

/**
 * About page route
 */
router.get('/login', function(req, res) {
    res.render('index')
});

module.exports = router;
