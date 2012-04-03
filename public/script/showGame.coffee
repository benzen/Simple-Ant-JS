define ["lib/jquery"], ->
  cercleRadius = 5
  drawGraph =->
    ctx = $("canvas").get(0).getContext("2d")
    drawAnt ctx
    drawPath ctx
    
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
    showGame:->
      $(".body").ready ->
        $(".body").load "showGame.html", ()->
          drawGraph()
          
        
  }