require(["lib/jquery","lib/jquery-ui"], function(){
    var loadSubPage = function(pageName, then){
        $(".body").load(pageName+".html", then);    
    };
    
    
    $().ready(function(){
         loadSubPage("mainPage");
        $("#mainPage").click(function(){
            loadSubPage("mainPage");
        });
        $("#newGame").click(function(){
            require(["newGame"],function(newGame){
                loadSubPage("newGame",newGame.init);
            });
        });
        
    });
    
});

