class GameStatus
  @cercleRadius : 5
  @cell_size: 10
  @smellToColor : (d)=>
    console.log "color #{d}"
    if d == "E" then return "red"
    if d == "A" then return "black"
    return "\##{(parseInt(0x985d05)+parseInt(d)).toString(16)}"

  @drawRectangle: ( ctx, color, x, y, height, width ) =>
    ctx.fillStyle = color
    ctx.fillRect( x, y, height, width )

  @drawCercle: (ctx, color, x,y, radius=cercleRadius)=>
    ctx.fillStyle = color
    ctx.beginPath()
    ctx.arc(x,y,radius,0,Math.PI*2)
    ctx.closePath()
    ctx.fill()

  @drawAnt: (ctx, x, y)=>
    radius = 2
    [color,centerRadius, cx, y1,y2,y3]=['white', (radius*0.5), (x+radius*2), y+radius, y+2*radius, y+3*radius]
    @drawCercle ctx, color, cx, y1, radius
    @drawCercle ctx, color, cx, y2, centerRadius
    @drawCercle ctx, color, cx, y3, radius

#  @drawPath: (ctx)=>
#    @drawCercle ctx, "#059863", 10, 18

  @renderGameStatus: (data)=>
    ctx = $("canvas").get(0).getContext("2d")
    ctx.clearRect 0, 0, $("canvas").attr("width"), $("canvas").attr("height")

    for column, column_index in data
      for cell, cell_index in column
        if cell == "a"
          console.log "draw ant"
          @drawAnt ctx, cell_index, column_index
        else
          console.log "draw rectangle"
          color = @smellToColor cell
          @drawRectangle ctx, color, cell_index, column_index, @cell_size, @cell_size

window.GameStatus = GameStatus