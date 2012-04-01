
express = require('express')

require("./ant")

app = express.createServer express.logger()

app.get('/', (request, response)->
  response.send('Hello World!')
)

port = process.env.PORT || 3000;
app.listen(port, ()->
  console.log("Listening on " + port)
)

app.get('/ant', (request, response)->
  new Ant(0,0).smell("nothing")
  response.send('Hello World!')
)