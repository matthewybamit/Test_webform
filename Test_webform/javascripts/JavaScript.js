
// JavaScript to toggle visibility of the top navigation on scroll



$(document).ready(function () {
    var lastScrollTop = 0;

    $(window).scroll(function (event) {
        var st = $(this).scrollTop();
        if (st > lastScrollTop) {
            // Scroll down
            $("#topnav").removeClass("visible").addClass("hidden");
        } else {
            // Scroll up
            $("#topnav").removeClass("hidden").addClass("visible");
        }
        lastScrollTop = st;
    });
});


$(document).ready(function () {
    var slideIndex = 0; // Initialize slide index

    // Function to move to the next slide
    function nextSlide() {
        var slideWidth = $('.slides a').eq(0).outerWidth();
        slideIndex = (slideIndex + 1) % $('.slides a').length; // Increment slide index
        $('.slides').css('transform', 'translateX(' + (-slideIndex * slideWidth) + 'px)');
        updateSliderIndicator(); // Update slider indicator
    }

    // Function to update the slider indicator
    function updateSliderIndicator() {
        $('.slider').removeClass('active');
        $('.slider[data-slide="' + slideIndex + '"]').addClass('active');
    }

    // Set interval to automatically move to the next slide every 8 seconds
    var interval = setInterval(nextSlide, 4000);

    // Click event handler for slider
    $('.slider').click(function () {
        clearInterval(interval); // Clear previous interval
        slideIndex = $(this).data('slide'); // Update slide index
        var slideWidth = $('.slides a').eq(0).outerWidth();
        $('.slides').css('transform', 'translateX(' + (-slideIndex * slideWidth) + 'px)');
        updateSliderIndicator(); // Update slider indicator
        // Set new interval after click
        interval = setInterval(nextSlide, 4000);
    });
});
