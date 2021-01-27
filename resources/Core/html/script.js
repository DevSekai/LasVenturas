$(function(){
    window.addEventListener("message", function(event){
        if (event.data.card == "id") {
            var display = event.data.display;
            $(".IdCard").css("display", display);
            var name = event.data.name;
            $("#name").html(name);
            var birthday = event.data.birthday;
            $("#birthday").html(birthday);
            var job = event.data.job;
            $("#job").html(job);
        } else {
            $(".IdCar_CarCard").fadeOut();
        }
    })
})