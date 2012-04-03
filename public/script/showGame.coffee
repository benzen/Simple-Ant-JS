define ["lib/jquery"], ->
  showGame = ->
    $(".body").load "showGame.html"

  return {
    showGame:showGame
  }