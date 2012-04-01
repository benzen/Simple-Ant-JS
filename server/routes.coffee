express = require('express')
require('jade')
game = require("./Game")



app = express.createServer express.logger()
##app.set('view engine', 'jade');
app.use(express.static(__dirname + '/public'));

app.get('/', (request, response)->
  response.render("game")
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
  game.startGame(anthillx,anthillY, nbOfAnt, boardWidth, boardHeight, eatX, eatY)
)