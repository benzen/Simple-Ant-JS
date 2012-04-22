b = require "./Board"
a = require "./Ant"

counter = 0
incCounter = ->
  counter++
  return counter

games = []
saveGame = (board, ants)->
  gameId = incCounter()
  games[gameId]= {
    "ants":ants
    "board":board
  }
  console.log games[gameId]
  gameId

startGame=(gameId)->
  ants = games[gameId].ants
  for ant in ants
    ant.lives()

createGame = (anthillX,anthillY, nbOfAnt, mapSize, eatX, eatY)->
  board = new b.Board(mapSize, anthillX, anthillY, eatX, eatY)
  ants = for times in [0..nbOfAnt]
    new a.Ant(anthillX,anthillY)
  "#{saveGame  board, ants}"

status = (gameId)->
  boardStatus = games[gameId].board.status()
  for
  status

 exports.startGame = startGame
 exports.saveGame = saveGame
 exports.createGame = createGame
 exports.status = status