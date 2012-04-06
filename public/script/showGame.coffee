define ["lib/jquery"], ->
  cercleRadius = 5
  smellToColor = (d)->
    if d == "E" then return "red"
    if d == "A" then return "black"
    return "\##{0x985d05+d}"
  dataToRectangleConfig = (row,column,smell)->
    [smellToColor( smell), row*width,column*height,row,column]
  
  createMapConf = (data) ->
    [width, height] = [10,10]
    mapConf = for row in [0..data.length-1]
      for column in [0..(data[row].length-1)]
        smell = data[row][column]
        dataToRectangleConfig smell, row, column
        
  drawGraph =(data)->
    ctx = $("canvas").get(0).getContext("2d")
    ctx.scale(2,2)
    createMapConf data
   

  drawRectangle = ( ctx, color, x, y, height, width ) ->
    ctx.fillStyle = color
    ctx.fillRect( x, y, height, width )
  
  drawCercle =(ctx, color, x,y)->
    ctx.fillStyle = color  
    ctx.beginPath()
    ctx.arc(x,y,cercleRadius,Math.PI*2,true)
    ctx.closePath()
    ctx.fill() 
   drawAnt = (ctx)->
    drawCercle ctx, "#985D05", 70,18
   drawPath = (ctx)->
    drawCercle ctx, "#059863", 10, 18

  return {
    showGame:(gameId)->
      $(".body").ready ->
        $(".body").load "showGame.html", ()->
          $.ajax("game/#{gameId}/status", {
            success: (data)->drawGraph(data)
          } )
          
        
  }