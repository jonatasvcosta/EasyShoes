var app = require('express')();
var express = require('express');
var bodyParser = require('body-parser');
var multer = require('multer'); // v1.0.5
var upload = multer(); // for parsing multipart/form-data

app.use(bodyParser.json()); // for parsing application/json
app.use(bodyParser.urlencoded({ extended: true })); // for parsing application/x-www-form-urlencoded

var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

/* Saves a new user in the database */
router.get('/criar_conta',upload.array(),function (req, res, next) {
    console.log(req.body);
    console.log(req.body.email);
    //console.log(req.body);
    res.render('index');
});

module.exports = router;
