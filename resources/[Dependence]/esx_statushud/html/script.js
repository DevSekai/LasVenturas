$(function(){
    window.addEventListener("message", function(event){
        if (event.data.pauseMenu == false) {
            $(".ui").fadeIn();
            var food = event.data.food;
            $("#FoodOp").css("opacity", food);
            var water = event.data.water;
            $("#WaterOp").css("opacity", water);
            var drunk = event.data.drunk;
            $("#DrunkOp").css("opacity", drunk);
        } else {
            $(".ui").fadeOut();
        }
    })
})