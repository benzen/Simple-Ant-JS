b = require "./Board"
a = require "./ant"

counter = 0
incCounter = ->
  counter++
  
games = []
saveGame = (board, ants)->
  gameId = incCounter()
  games[gameId]= {
    "ants":ants
    "board":board
  }

startGame=(gameId)->
  ants = games[gameId].ants
  for ant in ants
    ant.smell("nothing")

createGame = (anthillX,anthillY, nbOfAnt, boardWidth, boardHeight, eatX, eatY)->
  board = new b.Board(boardWidth, boardHeight, anthillX, anthillY, eatX, eatY)
  ants = for times in nbOfAnt
    new a.Ant(anthillX,anthillY)
  "#{saveGame  board, ants}"

status = (gameId)->
  status = games[gameId].board.status()
  console.log status 
  status
  
 exports.startGame = startGame
 exports.saveGame = saveGame
 exports.createGame = createGame
 exports.status = status