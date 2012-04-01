
express = require('express')

ant = require("./ant")

app = express.createServer express.logger()

app.get('/', (request, response)->
  response.send('Hello World!')
)

port = process.env.PORT || 3000;
app.listen(port, ()->
  console.log("Listening on " + port)
)

app.get('/ant', (request, response)->
  console.log(ant)
  new ant.Ant(0,0).smell("nothing")
  response.send('Hello World!')
)