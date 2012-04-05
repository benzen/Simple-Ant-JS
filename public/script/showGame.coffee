define ["lib/jquery"], ->
  cercleRadius = 5
  drawGraph =(data)->
    ctx = $("canvas").get(0).getContext("2d")
    drawAnt ctx
    drawPath ctx
    
   drawCercle =(ctx, color, x,y)->
    ctx.fillStyle = color  
    ctx.beginPath()
    ctx.arc(x,y,cercleRadius,Math.PI*2,true)
    ctx.closePath()
    ctx.fill()
   
   drawRectangle = ( ctx, color, x, y, height, width ) ->
    ctx.fillStyle = color
    ctx.fillRect( x, y, height, width )
   
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