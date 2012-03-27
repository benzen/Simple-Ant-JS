define ["lib/jquery"], ()->
    loadSubPage = ( pageName, thenFunc )->
        $(".body").load pageName+".html", thenFunc
    return ->
        loadSubPage "mainPage"
        $("#mainPage").click -> loadSubPage("mainPage")
        $("#newGame").click ->
            require ["cs!newGame"], (newGame) ->
                loadSubPage "newGame", newGame.init
