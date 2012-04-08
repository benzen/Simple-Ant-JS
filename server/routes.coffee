express = require('express')
_ = require("underscore")
game = require("./Game")

app = express.createServer express.logger()
app.set 'view engine', 'jade'
app.set 'view options', { layout: false }
app.use express.bodyParser()

port = process.env.PORT || 3000;
app.listen(port, ()->
  console.log("Listening on " + port)
)

app.post('/createGame', (req, resp)->
  console.info "/createGame"
  b = req.body
  params = [b.anthillX,b.anthillY, b.nbOfAnt, b.mapSize, b.eatX, b.eatY]
  [anthillX, anthillY, nbOfAnt, mapSize,eatX, eatY] = _.map(params,parseInt)
  console.info """ 
  params
    anthillX #{anthillX},
    anthillY #{anthillY},
    nbOfAnt #{nbOfAnt},
    mapSize #{mapSize},
    eatX #{eatX},
    eatY #{eatY}
  """
  resp.send game.createGame(anthillX,anthillY, nbOfAnt, mapSize, eatX, eatY)
)

app.get("/game/:id/status", (req,resp)->
  console.info "/game/id/status"
  console.info "param id #{req.params.id}"
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