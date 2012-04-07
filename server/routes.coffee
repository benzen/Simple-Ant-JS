express = require('express')
game = require("./Game")



app = express.createServer express.logger()

app.configure(->  
  app.use( express.static(__dirname + '/../public') )  
)
app.set 'view engine', 'chtml'
app.register '.chtml', require('coffeecup').adapters.express

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
  
  resp.send game.createGame(anthillx,anthillY, nbOfAnt, mapSize, eatX, eatY)
)

app.get("/game/:id/status", (req,resp)->
  game.startGame req.params.id
  
  resp.send game.status(req.params.id)
)
app.get '/', (req, res) ->
  # Will render views/index.coffee:
  res.render 'index', foo: 'bar'