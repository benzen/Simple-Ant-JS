define ["lib/jquery"], ->
  cercleRadius = 5
  smellToColor = (d)->
    if d == "E" then return "red"
    if d == "A" then return "black"
    return "\##{0x985d05+d}"
  dataToRectangleConfig = (row,column,smell)->
    [width, height] = [10,10]
    conf =
      smell: smellToColor( smell)
      x: row*width
      y: column*height
      height: row
      widht: column
    conf
  
  createMapConf = (data) ->
    mapConfig = []
    for column in data
      for cell in column
        smell = cell
        mapConfig.push dataToRectangleConfig( smell, (column.indexOf cell), (data.indexOf column))
    mapConfig  
   

  drawGraph =(data)->
    ctx = $("canvas").get(0).getContext("2d")
    ctx.scale(2,2)
    drawRectangle( ctx, conf.smell, conf.x,conf.y, conf.width, conf.height) for conf in createMapConf( data)
   

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