define ["lib/jquery"], ->
  drawGraph:->
    ctx = $("canvas").getContext("2d")
    drawAnt ctx
    drawPath ctx
    
   drawAnt = (ctx)->
    ctx.fillStyle = "#985D05"  
    ctx.beginPath()
    ctx.arc(70,18,15,0,Math.PI*2,true)
    ctx.closePath()
    ctx.fill()
   drawPath = (ctx)->
    ctx.fillStyle = "#059863"
    ctx.beginPath()
    ctx.arc(10,18,15,0,Math.PI*2,true)
    ctx.closePath()
    ctx.fill()

  return {
    showGame:->
      $(".body").ready ->
        $(".body").load "showGame.html", ()->
          drawGraph()
          
        
  }