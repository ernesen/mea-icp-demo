var express = require('express');
var app = express();
var mongodb = require('mongodb');
var MongoClient = mongodb.MongoClient;
var bodyParser = require('body-parser');

var port = (process.env.PORT ||  8888);
var mongo_host = (process.env.MONGO_SERVICE_HOST || 'localhost' );
var mongo_port = (process.env.MONGO_SERVICE_PORT || 27017 );
var localstring = 'mongodb://'+mongo_host+':'+mongo_port+'/quotes';

// set the view engine to ejs
app.set('view engine', 'ejs');

//use bodyParser
app.use(bodyParser.urlencoded({
  extended: true
}));

app.use(bodyParser.json());

var db;

// URL at which MongoDB service is running
var url = "mongodb://localhost:27017/quotes";

// https://www.mongodb.com/download-center#enterprise
// fixed
// https://www.tutorialkart.com/nodejs/mongoerror-failed-to-connect-to-server/

MongoClient.connect(localstring, function(err, database) {
//MongoClient.connect(url, function(err, database) {
  if (err) return console.log(err);
  db = database;
	 // start server on the specified port and binding host
	 app.listen(port, '0.0.0.0', function() {
	  // print a message when the server starts listening
		  console.log("server starting on http://"+mongo_host+":"+ port);
	 });
});

app.get('/', function(req, res) {
  db.collection('quotes').find().toArray( function(err, result) {
    if (err) return console.log(err)
    // renders index.ejs
    res.render('index.ejs', {quotes: result})
  })
})

app.post('/quotes', function(req, res) {
  db.collection('quotes').save(req.body, function(err, result)  {
    if (err) return console.log(err)
    console.log('saved to database')
    res.redirect('/')
  })
})
