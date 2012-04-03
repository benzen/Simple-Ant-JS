define ["lib/jquery"], ->
  dawGraph:->
    ctx = $("canvas").getContext("2d")
    ctx.fillStyle "#FF0000";
    ctx.fillRect(0,0,150,75);
    

  return {
    showGame:->
      $(".body").ready ->
        $(".body").load "showGame.html", ()->
          drawGraph()
          
        
  }