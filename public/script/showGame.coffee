define ["lib/jquery"], ->
  showGame:()->
    changePage()
  changePage:->
    $(".body").load "showGame.html"
  return {
    showGame:showGame
}