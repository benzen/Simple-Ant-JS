define ["lib/jquery","cs!showGame"], ($,showGame) ->
    initSpinners = ->
        $(".spinner").attr("value",0)
        $(".spinner").attr("min",0)
        $(".spinner").attr("max",100)
        $(".spinner").attr("width",20)
    initButtons = ->
        $(".start").click -> 
          $.ajax {
            url:"createGame"
            success:(data)-> showGame.showGame data
            data:{
                nbOfAnt: $("#nbOfAnts").val()
                anthillX: $("#anthillX").val()
                anthillY: $("#anthillY").val()
                eatX: $("#eatX").val()
                eatY: $("#eatY").val()
                mapSize: $("#mapSize").val()
              }
            }
            
    return {
        init: ->
            $().ready ->
                initSpinners()
                initButtons()
    }
