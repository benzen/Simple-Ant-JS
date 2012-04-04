class Board
  construct:(@width,@height,@anthillX,@anthillY,@eatX,@eatY)->
    for row in [0..@height]
      @smell[row]=[]
      for colon in [0..@width]
        @smell[row][colon]=0

  ## snort a position
  snort:(x,y)->
    if @height<x or @height<y
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
    
  status:->
    caseToString=(x,y)->
      if x == @anthillX and y == @anthillY then return "A"
      else if x == @eatX and y == @eatY then return "E"
      else "#{@smell[x][y]}"
    map=[]
    for row in [0..@height]
      map[row]=[]
      for colon in [0..@width]
       console.log("row #{row} colon #{colon}")
       map[row][colon]=caseToString(row,colon) 
    map
      
  
exports.Board = Board  