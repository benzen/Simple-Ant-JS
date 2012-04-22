express = require('express')
_ = require("underscore")
gameManagerModule = require("./GameManager")
gameManager = new gameManagerModule.GameManager()

app = express.createServer express.logger()
app.set 'view engine', 'jade'
app.set 'view options', { layout: false }
app.use express.bodyParser()

port = process.env.PORT || 3000;
app.listen(port, ()->
  console.log("Listening on " + port)
)

app.post('/createGame', (req, res)->
  console.info "/createGame"
  b = req.body
  params = [b.anthillX, b.anthillY, b.nbOfAnt, b.mapSize, b.eatX, b.eatY]
  [anthillX, anthillY, nbOfAnt, mapSize,eatX, eatY] = _.map(params,(v,i,l)->parseInt(v))
  console.info """
  params
    anthillX #{anthillX},
    anthillY #{anthillY},
    nbOfAnt #{nbOfAnt},
    mapSize #{mapSize},
    eatX #{eatX},
    eatY #{eatY}
  """
  gameId = gameManager.createGame(anthillX,anthillY, nbOfAnt, mapSize, eatX, eatY)
  gameManager.startGame gameId
  res.redirect "/game/#{gameId}/status"
)

app.get("/game/:id/status", (req,res)->
  console.info "/game/id/status"
##TODO pass id of the game to the render
  res.render "gameStatus"
)
app.get("/game/:id/status.json",(req,res) ->
  console.info "/game/id/status.json"
  gameId = req.params.id
  console.log "game id #{gameId}"
  gameStatus = JSON.stringify( gameManager.status(gameId) )
  res.send gameStatus
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