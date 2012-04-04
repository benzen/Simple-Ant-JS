express = require('express')
require('jade')
game = require("./Game")



app = express.createServer express.logger()

app.configure(->  
  app.use( express.static(__dirname + '/../public') )  
)

port = process.env.PORT || 3000;
app.listen(port, ()->
  console.log("Listening on " + port)
)

app.get('/createGame', (req, response)->
  
  anthillx = req.params.anthillX
  anthillY = 10
  nbOfAnt = 1
  boardWidth = 20
  boardHeight = 20
  eatX=18
  eatY=18
  response.send game.createGame(anthillx,anthillY, nbOfAnt, boardWidth, boardHeight, eatX, eatY)
)

app.get("/game/:id/status", (req,resp)->
  game.startGame req.params.id
  
  resp.send game.status(req.params.id)
)