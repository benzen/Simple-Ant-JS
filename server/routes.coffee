
express = require('express')

game = require("./Game")

app = express.createServer express.logger()

app.get('/', (request, response)->
  response.send('Hello World!')
)

port = process.env.PORT || 3000;
app.listen(port, ()->
  console.log("Listening on " + port)
)

app.get('/startAnt', (request, response)->
  anthillx = 10
  anthillY = 10
  nbOfAnt = 1
  boardWidth = 20
  boardHeight = 20
  eatX=18
  eatY=18
  game.start(anthillx,anthillY, nbOfAnt, boardWidth, boardHeight, eatX, eatY)
)