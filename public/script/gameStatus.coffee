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

  drawAnt = (ctx, x, y)->
    radius = 5
    [color,centerRadius, lx, y1,y2,y3]=['white', radius-2, x+radius, y+radius, y+2*radius, y+3*radius]
    drawCercle ctx, color, x, y1, radius
    drawCercle ctx, color, x, y2, centerRadius
    drawCercle ctx, color, x, y3, radius

  drawPath = (ctx)->
    drawCercle ctx, "#059863", 10, 18

  renderGameStatus = (data)->
    ctx = $("canvas").get(0).getContext("2d")
    drawRectangle( ctx, conf.color, conf.x,conf.y, conf.width, conf.height) for conf in createMapConf( data)
    drawAnt ctx,5,5
  return {
    renderGameStatus:renderGameStatus
  }
