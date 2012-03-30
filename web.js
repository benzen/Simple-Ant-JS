var express = require('express');
require("coffee-script");
var a = require("./server/ant");

var app = express.createServer(express.logger());

app.get('/', function(request, response) {
  response.send('Hello World!');
});

var port = process.env.PORT || 3000;
app.listen(port, function() {
  console.log("Listening on " + port);
});

app.get('/ant', function(request, response) {
    console.log(a);
     new a(0,0).smell("nothing");

    response.send('Hello World!');
});