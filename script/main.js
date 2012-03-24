require(["lib/jquery"], function(){
    var loadSubPage = function(pageName){
        $(".body").load(pageName+".html");
    };
    
    $().ready(function(){
         loadSubPage("mainPage");
        $("#mainPage").click(function(){
            loadSubPage("mainPage");
        });
        $("#newGame").click(function(){
            require(["newGame"],function(){
                loadSubPage("newGame");
            });
            
        });
        
    });
    
});

