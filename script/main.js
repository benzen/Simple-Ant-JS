require(["lib/jquery","lib/jquery-ui","lib/jquery-ui-spinner"], function(){
    var loadSubPage = function(pageName, then){
        $(".body").load(pageName+".html", then);    
    };
    var addSpinner = function(){
        $('.spinner').spinner({ min: 0, max: 100 });
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

