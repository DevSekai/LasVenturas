$(function(){
    window.addEventListener("message", function(event){
        if (event.data.pauseMenu == false) {
            $(".ui").fadeIn();
            var food = event.data.food;
            $("#food").css("opacity", food / 100);
            var water = event.data.water;
            $("#water").css("opacity", water / 100);
        } else {
            $(".ui").fadeOut();
        }
    })
})