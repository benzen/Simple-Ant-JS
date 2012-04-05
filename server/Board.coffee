class Board
  constructor:(@mapSize, @anthillX,@anthillY,@eatX,@eatY)->
    @smell=[]
    for row in [1..@mapSize]
      @smell[row]=[]
      for colon in [0..@mapSize]
        @smell[row][colon]=0

  ## snort a position
  snort:(x,y)->
    if @mapSize<x or @mapSize<y
      return "out of bounds"
    if x == @anthillX and y == @anthillY
      return "home"
    if x == @eatX and y == @eatY
      return "eat"
    else "nothing"

  ##allow user to now the streingth of the eat path
  eatPathStrength:(x,y)->
    @smell[x][y]
  
  ## make a path from a food place
  addSmell:(x,y)->
    @smell[x][y]=@smell[x][y]+1
  
  caseToString:(x,y)->
    if (x == @anthillX) and (y == @anthillY)
      return "A"
    else if (x == @eatX) and (y == @eatY)
      return "E"
    else return "#{@smell[x][y]}"  
  
  status:->  
    map=[]
    for row in [1..@mapSize]
      map[row]=[]
      for column in [1..@mapSize]
        map[row][column] = @caseToString(row,column) 
    map
      
  
exports.Board = Board  