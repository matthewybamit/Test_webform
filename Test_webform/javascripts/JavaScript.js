
// JavaScript to toggle visibility of the top navigation on scroll


window.onload = function () {
    // Retrieve user data from session storage
    const username = sessionStorage.getItem('username');
    const name = sessionStorage.getItem('name');
    const profilePicture = sessionStorage.getItem('profilePicture');

    // Display the data in your HTML elements
    document.getElementById('profile-name').textContent = name;
    document.getElementById('profile-picture').style.backgroundImage = `url('${profilePicture}')`;
};

// Function to logout
function logout() {
    sessionStorage.clear(); // Clear session storage
    window.location.href = 'login-page.aspx'; // Redirect to login page
}

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

document.getElementById("search-icon").addEventListener("click", function () {
    document.getElementById("search-box").classList.toggle("active"); // toggle the 'active' class
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

