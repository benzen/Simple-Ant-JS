b = require "./Board"
a = require "./Ant"

class GameManager
  constructor: ->
    @counter = 0
    @games = []

  incCounter : ->
    @counter++
    return @counter


  saveGame : (board, ants)->
    gameId = @incCounter()
    @games[gameId]= {
      "ants":ants
      "board":board
    }
    console.log @games[gameId]
    gameId

  startGame:(gameId)->
    ants = @games[gameId].ants
    for ant in ants
      ant.lives()

  createGame : (anthillX,anthillY, nbOfAnt, mapSize, eatX, eatY)->
    board = new b.Board(mapSize, anthillX, anthillY, eatX, eatY)
    ants = for times in [0..nbOfAnt]
      new a.Ant(anthillX,anthillY)
    "#{@saveGame  board, ants}"

  status : (gameId)->
    boardStatus = @games[gameId].board.status()
    antStatus = [ant.x, ant.y] for ant in @games[gameId].ants
    boardStatus[antPos[0]][antPos[1]]='a' for antPos in antStatus

exports.GameManager = GameManager
