   <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Landing-page.aspx.cs" Inherits="Test_webform.Test_webform" %>


<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>DRESSERVE</title>
        <link href="https://fonts.cdnfonts.com/css/kapakana" rel="stylesheet">
       <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
         <script src="javascripts/JavaScript.js"></script>
         <link rel="stylesheet" href="CSS/Copy.css">
         <link rel="stylesheet" href="CSS/Carousel.css">  
         <link rel="stylesheet" href="CSS/for_him_for_her.css">
         <link rel="stylesheet" href="CSS/Collection-list.css">  
         <link rel="stylesheet" href="CSS/Quote.css">  
         <link rel="stylesheet" href="CSS/inquire-view.css">  
         <link rel="stylesheet" href="CSS/Footer.css">  
            <link type="text/css" href="CSS/search-box-animation.css" rel="stylesheet" />
            <link rel="stylesheet" href="CSS/StyleSheet1 - Copy.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
   




    <body>

   <!--TOP NAV-->
<div class="topnav visible" id="topnav">
    <!-- LOGO -->   
    <img class="logo" src="Dresserve.png" alt="">
    <a class="active" href="#home">Dresserve</a>
    <!-- END -->  

    <!--NAV ICON-->
    <div class="topnav-right">
        <a href="#home" id="search-icon">
  <img class="icon" src="magnifying-glass.png" alt="Search">
</a>
<div id="search-box">
  <input type="text" id="search-input" placeholder="Enter your search">
</div>
        <a href="Landing-page.aspx"><img class="icon" src="shopping-bag.png" alt="Shopping Bag"></a>
        <a href="user-profile.aspx"><img class="icon" src="user-logo.png" alt="User"></a>
        <a href="#home"><img class="icon" id="burger" src="hamburger.png" alt="Menu"></a>   

</div>
    </div>
    <!-- END -->  
</div>

  <!-- END -->  

      


    <!--Courosel-->
   
       <div class="container">
        <div class="slides"> 
            <a href="#"><img src="2.jpg" alt="Slide 1" id="carousel1"></a>
            <a href="#"><img src="2.jpg" alt="Slide 2" id="carousel2"></a>
            <a href="#"><img src="3.jpg" alt="Slide 3" id="carousel3"></a>
        </div>
        <div class="sliders">
            <a class="slider" data-slide="0"></a>
            <a class="slider" data-slide="1"></a>
            <a class="slider" data-slide="2"></a>
        </div>
    </div>

    
    <!--END-->

            <div class="text-between-containers">
                <span>|  TRY  |  CUSTOMIZE  |  RENT  |</span>
            </div>


<!--FOR HIM FOR HER-->

  <div class="container1">
  <div class="box" id="box1">
    <img src="for-him.jpg" id="image1" alt="Image 1">
    <a href="hes_him.html" class="box-link">FOR HIM</a> 
  
  </div>
  <div class="box">   
    <img src="for-her.jpg" id="image2" alt="Image 2">
    <a href="#" class="box-link">FOR HER</a> 
   
  </div>
</div>

<!--END-->



         <div class="text-between-collections">
     <span>COLLECTION LIST</span>
 </div>




<!--COLLECTION LIST-->
    <div class="collections">
    <div class="collection-list">
        <div class="collection-item">
            <img src="wedding.png" alt="Wedding Gowns">
            <a href="wedding.aspx" class="collection-link" id="wedding-link">Wedding Gowns</a>
        </div>
        <div class="collection-item">
            <img src="debut.png" alt="Debut Gowns"  >
            <a href="debut.html" class="collection-link" id="debut-link" >Debut Gowns</a>
        </div>
        <div class="collection-item">
            <img src="formal.png" alt="Formal">
            <a href="formal.html" class="collection-link" id="formal-link">Formal</a>
        </div>
        <div class="collection-item">
            <img src="dresses.png" alt="Dresses">
            <a href="dresses.html" class="collection-link" id="dress-link">Dresses</a>
        </div>
    </div>
</div>
        <!--END-->

  <!--QUOTE/SHOP-->

  <div class="container-quote">
    <img src="gown.png" alt="Quote image" class="quote-image" />
    <div class="quote">
        <p id="line-1">Once in a Lifetime Event</p>
        <p id="line-2">Let us show you what you Deserve</p>      
    </div>
      <button class="shop-now" href="WebForm4.aspx">Shop Now</button>
</div>


                 <!--INQUIRE/VIEWMORE-->
    
 <div class="Inquire-veiw-container">
  <div class="inquire-box">
    <img src="inquire.jpg" id="inquire-image" alt="inquire-image">
    <p class="inquire-view-link" id="inquire-text">Find Your Piece</p> 
    <a href="inquire.html" class="inquire-view-link" id="inquire-id">Inquire</a> 
  </div>
  <div class="inquire-box">   
    <img src="viewmore.jpg" id="view-image" alt="view-image">
    <p class="inquire-view-link" id="view-more-text">Dress For Every Occassion</p> 
    <a href="#" class="inquire-view-link" id="view-more-id">View More</a> 
  </div>
</div>

                 <!--END-->



                 <!--FOOTER -->

      <footer class="footer">
  <div class="footer__addr">
    <h1 class="footer__logo">Dresserve</h1>
     <img src="Dresserve.png"  class="footer-logo"/>
    <h2>Contact</h2>
    
    <address>
      5534 Somewhere In. The World 22193-10212<br>
          
    
    </address>
  </div>
  
  <ul class="footer__nav">
    <li class="nav__item">
      <h2 class="nav__title">INFO</h2>

      <ul class="nav__ul">
        <li>
          <a href="aboutus.html">About Us</a>
        </li>

        <li>
          <a href="contact.html">Contact Us</a>
        </li>
            
        <li>
          <a href="faqs.html">FAQs</a>
        </li>
      </ul>
    </li>
    
    <li class="nav__item nav__item--extra">
      <h2 class="nav__title">OUR SERVICES</h2>
      
      <ul class="nav__ul nav__ul--extra">
        <li>
          <a >Rental</a>
        </li>
        
        <li>
          <a >Try-On</a>
        </li>
        
        <li>
          <a>Customization</a>
        </li>

        <li>
          <a>Customer Support</a>
        </li>
        
        <li>
          <a>Delivery and Pickup</a>
        </li>
        
        
      </ul>
    </li>
    
    <li class="nav__item">
      <h2 class="nav__title">SUBSCRIBE</h2>
    
      <ul class="nav__ul">
        <li>
                 <input id="subscribe-input" type="text" placeholder="Your Email">
                
        </li>
        <li>
            <button class="subscribe-btn">SEND</button>
        </li>

      </ul>
    </li>
  </ul>
   <div class="separator"></div>
   
  <div class="legal">
    <a><p>Terms and Condition   |   Privacy Policy   |  &copy; 2024 All rights reserved </p></a>
    
    <div class="legal__links">
      <span> <img scr="facebook (1).png" /> <span class="heart"></span> </span>
    </div>
  </div>
</footer>








         <!--END-->





   <!--JAVASCRIPTS-->



        <script>

            /*window.onload = function () {
                // Retrieve user data from session storage
                const username = sessionStorage.getItem('username');
                const name = sessionStorage.getItem('name');
                const profilePicture = sessionStorage.getItem('profilePicture');

                // Display the data in your HTML elements
                document.getElementById('profile-name').textContent = name;
                document.getElementById('profile-picture').src = profilePicture;
            };

            // Function to logout
            function logout() {
                sessionStorage.clear(); // Clear session storage
                window.location.href = 'login-page.aspx'; // Redirect to login page
            }*/

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




        </script>


    </body>