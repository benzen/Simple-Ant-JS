class Board
  construct:(@width,@height,@anthillX,@anthillY,@eatX,@eatY)->
    for row in @height
      @smell[row]=[]
      for colon in @width
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
  
  