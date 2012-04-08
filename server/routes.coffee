express = require('express')
game = require("./Game")



app = express.createServer express.logger()


app.set 'view engine', 'jade'
app.set 'view options', { layout: false }

port = process.env.PORT || 3000;
app.listen(port, ()->
  console.log("Listening on " + port)
)

app.get('/createGame', (req, resp)->
  anthillx = parseInt req.query.anthillX
  anthillY = parseInt req.query.anthillY
  nbOfAnt  = parseInt req.query.nbOfAnts
  mapSize  = parseInt req.query.mapSize
  eatX     = parseInt req.query.eatX
  eatY     = parseInt req.query.eatY
  console.log """
  anthillx #{anthillx},
  anthillY #{anthillY},
  nbOfAnt #{nbOfAnt},
  mapSize #{mapSize},
  eatX #{eatX},
  eatY #{eatY}
  """
  resp.send game.createGame(anthillx,anthillY, nbOfAnt, mapSize, eatX, eatY)
)

app.get("/game/:id/status", (req,resp)->
  game.startGame req.params.id
  
  resp.send game.status(req.params.id)
)
app.get '/', (req, res) ->
  res.render 'index'

app.get "/newGame", (req,res)->
  res.render "newGame"
app.configure(->  
  app.use( express.static(__dirname + '/../public') )  
)  