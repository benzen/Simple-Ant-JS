b = require "./Board"
a = require "./Ant"
pg = require "pg"
/*
pg.connect(process.env.DATABASE_URL, function(err, client) {
  var query = client.query('SELECT * FROM your_table');

  query.on('row', function(row) {
    console.log(JSON.stringify(row));
  });
});
*/
class GameManager
  constructor: ->
    @counter = 0
    @games = []
    createTableIfNecessary()

  createTableIfNecessary :()->
    var test = client.query('SELECT * FROM games');
    test.on("error",(error)->
      var queryc = client.query('CREATE TABLE games');
    )



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
    @gameTurn(gameId)
    boardStatus = @games[gameId].board.status()
    boardStatus[ant.x][ant.y]= 'a' for ant in @games[gameId].ants
    boardStatus
  gameTurn:(gameId)->
    ant.smell( @games[gameId].board.snort(ant.x, ant.y)) for  ant in @games[gameId].ants

exports.GameManager = GameManager
