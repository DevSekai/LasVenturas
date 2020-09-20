$(function(){
    window.addEventListener("message", function(event){
        if (event.data.pauseMenu == false) {
            $(".ui").fadeIn();
            var Hunger = event.data.Hunger;
            $("#Hunger-percent").html(Math.round(Hunger) + "%");
            $("#Hunger-level").css("width", Hunger + "%");
            var Thrist = event.data.Thrist;
            $("#Thrist-percent").html(Math.round(Thrist) + "%");
            $("#Thrist-level").css("width", Thrist + "%");
        } else {
            $(".ui").fadeOut();
        }
    })
})