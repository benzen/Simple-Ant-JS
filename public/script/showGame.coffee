define ["lib/jquery"], ->
  showGame = ->
    

  return {
    showGame:->
      $(".body").ready ->
        $(".body").load "showGame.html"
  }