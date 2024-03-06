$(function () {
    $(".nav-link").click(function () {
        if($(this).hasClass('active-icon')){
            $('.nav-link').removeClass('active-icon');
        } else {
            $('.nav-link').removeClass('active-icon');
            $(this).addClass('active-icon');
        }
    });
})
