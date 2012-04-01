b = require "./Board"
a = require "./ant"

game = (anthillX,anthillY, nbOfAnt, boardWidth, boardHeight, eatX, eatY)->
  board = new b.Board(boardWidth, boardHeight, anthillX, anthillY, eatX, eatY)
  ants = for times in nbOfAnt
    new a.Ant(anthillX,anthillY)
  for ant in ants
    ant.smell()
    
 exports.startGame = game