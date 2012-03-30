var express = require('express');
require("coffee-script");
require("./server/ant");

var app = express.createServer(express.logger());

app.get('/', function(request, response) {
  response.send('Hello World!');
});

var port = process.env.PORT || 3000;
app.listen(port, function() {
  console.log("Listening on " + port);
});

app.get('/ant', function(request, response) {
 new Ant().smell("nothing");
  response.send('Hello World!');
});