express = require('express')
_ = require("underscore")
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
  [anthillx, anthillY, nbOfAnt, mapSize,eatX, eatY] = _.map([req.body],parseInt)
  console.info """ 
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