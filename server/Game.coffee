b = require "./Board"
a = require "./ant"

counter = 0
incCounter = ->
  coutner = counter+1
  counter
  
games = []
saveGame = (gameId, board, ants)->
  games[gameId]= 
    "ants":ants
    "board":board

startGame=(gameId)->
  ants = games[gameId].ants
  for ant in ants
    ant.smell("nothing")

createGame = (anthillX,anthillY, nbOfAnt, boardWidth, boardHeight, eatX, eatY)->
  board = new b.Board(boardWidth, boardHeight, anthillX, anthillY, eatX, eatY)
  ants = for times in nbOfAnt
    new a.Ant(anthillX,anthillY)
  saveGame incCounter(), board, ants
    
  exports.startGame = startGame
  exports.saveGame = saveGame
  exports.createGame = createGame