var express = require('express');
require("coffee-script");
var Ant = require("./server/ant.coffee");

var app = express.createServer(express.logger());

app.get('/', function(request, response) {
  response.send('Hello World!');
});

var port = process.env.PORT || 3000;
app.listen(port, function() {
  console.log("Listening on " + port);
});

app.get('/ant', function(request, response) {
    console.log(Ant);
     new Ant(0,0).smell("nothing");

    response.send('Hello World!');
});