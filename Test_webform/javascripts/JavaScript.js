
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




//Searching animation and stuff

document.getElementById("search-icon").addEventListener("click", function () {
    document.getElementById("search-box").classList.toggle("active"); // toggle the 'active' class
});

document.getElementById("search-icon").addEventListener("click", function () {
    // Toggle the 'active' class on the .topnav-right element
    document.querySelector(".topnav-right").classList.toggle("active-padding");
});

// Get the input element
var input = document.getElementById("search-input");

// Add event listener for keydown event
input.addEventListener("keydown", function (event) {
    // Check if the key pressed is Enter (key code 13)
    if (event.keyCode === 13) {
        // Prevent the default action (e.g., form submission)
        event.preventDefault();
        // Clear the input value
        input.value = "";
        // Trigger your search function here
        // For example, you can call a function to handle the search
        performSearch();
    }
});

// Function to handle search
function performSearch() {
    // Get the search input value
    var searchTerm = document.getElementById("search-input").value;
    // Perform your search action here
    console.log("Search term:", searchTerm);
    // You can replace the console.log statement with your actual search logic
}


// Function to open the cart
function openCart() {
    document.getElementById('cart-overlay').classList.add('show-cart');
}

// Function to close the cart
function closeCart() {
    document.getElementById('cart-overlay').classList.remove('show-cart');
}

// Function to toggle the cart's visibility
function toggleCart() {
    var cartOverlay = document.getElementById('cart-overlay');
    if (cartOverlay.classList.contains('show-cart')) {
        closeCart();
    } else {
        openCart();
    }
}

// Event listener for opening/closing the cart
document.getElementById('open-form').addEventListener('click', function (event) {
    event.preventDefault(); // Prevent the default action of anchor tag
    toggleCart();
});

// Event listener for closing the cart
document.getElementById('close-cart').addEventListener('click', function (event) {
    event.preventDefault(); // Prevent the default action of anchor tag
    closeCart();
});

// Event listener for clicking outside the cart to close it
document.getElementById('cart-overlay').addEventListener('click', function (event) {
    if (event.target === document.getElementById('cart-overlay')) {
        closeCart();
    }
});