$(function(){
    window.addEventListener("message", function(event){
        var ServId = event.data.ServId;
        $("#ServId-percent").html(ServId);
        var DateTime = event.data.DateTime;
        $("#Date-percent").html(DateTime);
        var Hunger = event.data.Hunger;
        $("#Hunger-percent").html(Math.round(Hunger) + "%");
        $("#Hunger-level").css("width", Hunger + "%");
        var Thrist = event.data.Thrist;
        $("#Thrist-percent").html(Math.round(Thrist) + "%");
        $("#Thrist-level").css("width", Thrist + "%");
        if (event.data.Display) {
            $(".ui").css("display", "block");
            $("#Thrist-percent").css("display", "block");
            $("#Hunger-percent").css("display", "block");
            $("#Thrist-level").css("display", "block");
            $("#Hunger-level").css("display", "block");
        } else {
            $(".ui").css("display", "none");
            $("#Thrist-percent").css("display", "none");
            $("#Hunger-percent").css("display", "none");
            $("#Thrist-level").css("display", "none");
            $("#Hunger-level").css("display", "none");
        }
    })
})