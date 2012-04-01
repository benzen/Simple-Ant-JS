define ["lib/jquery"], ->
    initSpinners = ->
        $(".spinner").attr("value",0)
        $(".spinner").attr("min",0)
        $(".spinner").attr("max",100)
        $(".spinner").attr("width",20)
    initButtons = ->
        $(".start").click -> alert("test")
        $(".cancel").click -> initSpinners()
    return {
        init: ->
            $().ready ->
                initSpinners()
                initButtons()
    }
