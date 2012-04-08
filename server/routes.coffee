express = require('express')
game = require("./Game")

app = express.createServer express.logger()
app.set 'view engine', 'jade'
app.set 'view options', { layout: false }

port = process.env.PORT || 3000;
app.listen(port, ()->
  console.log("Listening on " + port)
)

app.post('/createGame', (req, resp)->
  console.info "/createGame"
  anthillx = parseInt req.query.anthillX
  anthillY = parseInt req.query.anthillY
  nbOfAnt  = parseInt req.query.nbOfAnts
  mapSize  = parseInt req.query.mapSize
  eatX     = parseInt req.query.eatX
  eatY     = parseInt req.query.eatY
  console.debug """ 
  params
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
  console.info "/game/id/status"
  console.debug "param id #{req.params.id}"
  game.startGame req.params.id
  resp.send game.status(req.params.id)
)
app.get '/', (req, res) ->
  console.log "/index"
  res.render 'index'

app.get "/newGame", (req,res)->
  console.log "/newGame"
  res.render "newGame"
  
app.configure(->  
  app.use( express.static(__dirname + '/../public') )  
)  