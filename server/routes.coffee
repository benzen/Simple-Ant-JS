express = require('express')
game = require("./Game")



app = express.createServer express.logger()

app.configure(->  
  app.use( express.static(__dirname + '/../public') )  
)

port = process.env.PORT || 3000;
app.listen(port, ()->
  console.log("Listening on " + port)
)

app.get('/createGame', (req, resp)->
  
  anthillx = req.params.anthillX
  anthillY = req.params.anthillY
  nbOfAnt  = req.params.nbOfAnts
  mapSize  = req.params.mapSize
  eatX     = req.params.eatX
  eatY     = req.params.eatY
  console.log("map size #{mapSize}")
  resp.send game.createGame(anthillx,anthillY, nbOfAnt, mapSize, eatX, eatY)
)

app.get("/game/:id/status", (req,resp)->
  game.startGame req.params.id
  
  resp.send game.status(req.params.id)
)