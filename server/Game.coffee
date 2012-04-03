b = require "./Board"
a = require "./ant"

counter = 0
incCounter = ->
  counter++
  
games = []
saveGame = (gameId, board, ants)->
  games[gameId]= 
    "ants":ants
    "board":board

startGame=(gameId)->
  ants = games[gameId].ants
  console.log("ant retreived")
  for ant in ants
    ant.smell("nothing")
  console.log("ants #{ants}")
  console.log("ants started")

createGame = (anthillX,anthillY, nbOfAnt, boardWidth, boardHeight, eatX, eatY)->
  board = new b.Board(boardWidth, boardHeight, anthillX, anthillY, eatX, eatY)
  ants = for times in nbOfAnt
    new a.Ant(anthillX,anthillY)
  saveGame incCounter(), board, ants
  "#{counter}"

status = (gameId)->
  games[gameId].board.status
  
 exports.startGame = startGame
 exports.saveGame = saveGame
 exports.createGame = createGame
 exports.status = status