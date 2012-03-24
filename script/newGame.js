require(["lib/jquery","lib/jquery-ui","lib/jquery-ui-spinner"],function(){
    $().ready(function(){
        $('#spinner').spinner({ min: 0, max: 100 });

    });
});