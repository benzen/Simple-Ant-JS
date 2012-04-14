define ()->
  cercleRadius = 5
  smellToColor = (d)->
    if d == "E" then return "red"
    if d == "A" then return "black"
    return "\##{(parseInt(0x985d05)+parseInt(d)).toString(16)}"

  dataToRectangleConfig = (smell,row,column)->
    [width, height] = [10,10]
    conf =
      color: smellToColor( smell)
      x: row*width
      y: column*height
      width: width
      height: height
    conf

  createMapConf = (data) ->
    mapConfig = []
    [x,y]=[0,0]
    for row in data
      for cell in row
        smell = cell
        mapConfig.push dataToRectangleConfig( smell, x, y )
        x++
      x=0
      y++
    mapConfig

  drawRectangle = ( ctx, color, x, y, height, width ) ->
    ctx.fillStyle = color
    ctx.fillRect( x, y, height, width )

  drawCercle = (ctx, color, x,y, radius=cercleRadius)->
    ctx.fillStyle = color
    ctx.beginPath()
    ctx.arc(x,y,radius,0,Math.PI*2)
    ctx.closePath()
    ctx.fill()

  drawAnt = (ctx)->
    color = 'white'
    drawCercle ctx, color, 1, 10, 5
    drawCercle ctx, color, 1, 14, 3
    drawCercle ctx, color, 1, 20, 5

  drawPath = (ctx)->
    drawCercle ctx, "#059863", 10, 18

  renderGameStatus = (data)->
    ctx = $("canvas").get(0).getContext("2d")
    ctx.scale(2,2)
    drawRectangle( ctx, conf.color, conf.x,conf.y, conf.width, conf.height) for conf in createMapConf( data)
    drawAnt ctx
  return {
    renderGameStatus:renderGameStatus
  }