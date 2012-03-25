require(["lib/jquery","lib/jquery-ui","lib/jquery-ui-spinner"], function(){
    var loadSubPage = function(pageName, then){
        $(".body").load(pageName+".html", then);    
    };
    var addSpinner = function(){
        $(".spinner").attr("value",0);
        $(".spinner").attr("min",0);
        $(".spinner").attr("max",100);
        $(".spinner").attr("width",20);
    };
    
    $().ready(function(){
         loadSubPage("mainPage");
        $("#mainPage").click(function(){
            loadSubPage("mainPage");
        });
        $("#newGame").click(function(){
            loadSubPage("newGame", addSpinner);
        });
        
    });
    
});

