﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="Test_webform.WebForm5" %>

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
            <link rel="stylesheet" href="CSS/heshim.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kaisei+Opti&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Barlow+Semi+Condensed:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

        <style>
            @font-face {
    font-family: 'Kaisei Opti';
    src: url('path/to/kaisei-opti.woff2') format('woff2'), /* Modern Browsers */
    url('path/to/kaisei-opti.woff') format('woff'); /* Older Browsers */
    font-weight: normal;
    font-style: normal;
}


            .containss {
                display: grid;
                grid-template-columns: repeat(2, 1fr); /* Three columns */
              
                gap: 10px; /* Gap between grid items */
                
                
            }
            .top{
                height: 130px;
            }
            .left {
                
               
                padding-left: 40%;
                padding-right: 10%;

            }

            .schartz {
                height: 420px;
                margin-left: 10%;
            }


            .pic {
                height: 600px;
                
            }
            .pics {
                  display: flex;
    justify-content: center;
                background-color: black;
                height: 600px;
                width: 380px;
                overflow: hidden;
            }
            .detailsss {
                font-size: 20px;
                font-family: "Barlow Semi Condensed", sans-serif;
            }

            .right {
                
                margin-top: 0%;
                padding-right: 30%;
            }
            .name {
                
                font-size: 20px;
                font-family: "Barlow Semi Condensed", sans-serif;
            }
            .product-labeln {
               font-size: 40px;

            }
            .product-labeld {
   font-size: 20px;

}
            .product-labelp {
   font-size: 30px;
}
            .s {
                font-size: 25px;
                font-weight: 1%;
                font-family: "Barlow Semi Condensed";
                margin-bottom: 0px;
            }
            .para {
                font-size: 15px;
                
                
                font-family: "Kaisei Opti", serif;
            }
            .parag {
                text-align: center;
                font-size: 15px;
                font-family: "Kaisei Opti", serif;
                margin-top: 50px;
            }
            #subscribe-input {
        width: 100%;
        border-radius: 2%;
        background-color: transparent;
        font-family: "Kaisei Opti", serif;
    }


            .rbutton {
                display: grid;
    grid-template-columns: repeat(8, 1fr);
    padding-left: 0px;
    
    
    margin-top: 20px;
  }
  .radio {
    margin-bottom: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 50px;
    height: 50px;
    border: 2px solid #000;
    border-radius: 5px;
    cursor: pointer;
  }
  .radio input[type="radio"] {
    display: none;
  }
  .radio input[type="radio"]:checked + label {
    background-color: #000;
    color: #fff;
  }


  .datesss {
    margin-left: 20%;
    
    font-family: "Barlow Semi Condensed", sans-serif;
  }
   .datebutton {
    display: flex;
            justify-content: center;
   }
   .datebutton2 {
    display: grid;
                grid-template-columns: repeat(3, 1fr); /* Three columns */
           
                gap: 10px;
   }
   .datebutton3 {
               margin-left: 30px;
               margin-right: 30px;
               text-align: center;
               font-family: "Barlow Semi Condensed", sans-serif;
               font-size: 20px;
   }
   #subscribe-input1 {
    width: 200px;
    height: 50px;
    text-align: center;
    background-color: transparent;
    border-radius: 5px;
    border-color: black;
    font-family: "Barlow Semi Condensed", sans-serif;
   }
   .lastt {
    display: flex;
            justify-content: center;
   }
   .last2 {
    display: grid;
                grid-template-columns: repeat(2, 1fr); /* Three columns */
                gap: 10px;
   }
   .last3 {
    margin-top: 30px;
               margin-right: 30px;
               text-align: center;
              margin-bottom: 30px;
               font-size: 30px;
   }
   .firstb {
    width: 150px;
    height: 40px;
    font-size: 20px;
    text-align: center;
    background-color: C7B1A6;
    border-color: transparent;
    font-family: "Barlow Semi Condensed", sans-serif;
    color: black;
   }   
   /* Styled dropdown */
    .styled-dropdown {
        position: relative;
        width: 150px; /* Adjust width as needed */
    }

    .dropdown {
        appearance: none;
        -webkit-appearance: none;
        -moz-appearance: none;
        background-color: transparent;
        border: 1px solid #ccc;
        padding: 10px;
        font-size: 16px;
        width: 100%;
        cursor: pointer;
        border-radius: 5px;
    }

    .dropdown-arrow {
        position: absolute;
        top: 50%;
        right: 10px;
        transform: translateY(-50%);
        width: 0;
        height: 0;
        border-left: 6px solid transparent;
        border-right: 6px solid transparent;
        border-top: 6px solid #333; /* Dropdown arrow color */
    }
   </style>
    </head>
   

    <body>

   <!--TOP NAV-->
<div class="topnav visible" id="topnav">
    <!-- LOGO -->   
    <img class="logo" src="Dresserve.png" alt="">
    <a class="active" href="Landing-page.aspx">Dresserve</a>
    <!-- END -->  

    <!--NAV ICON-->
    <div class="topnav-right">
        <a href="#home" id="search-icon">
  <img class="icon" src="magnifying-glass.png" alt="Search">
</a>
<div id="search-box">
  <input type="text" id="search-input" placeholder="Enter your search">
</div>
        <a href="#home"><img class="icon" src="shopping-bag.png" alt="Shopping Bag"></a>
        <a href="#home"><img class="icon" src="user-logo.png" alt="User"></a>
        <a href="#home"><img class="icon" id="burger" src="hamburger.png" alt="Menu"></a>   

</div>
    </div>
    <!-- END --> 
    <div class="top">
        
    </div> 
   <div class="containss">
    <div class="left">   
        
       <div class="pics">
            <img class="pic" id="productImage" src="" alt="" runat="server">
        </div> 
        
        <div class="detailsss">
            <h3>DETAILS</h3>
        </div>
        <img class="schartz" src="schart.png" alt="" >
    </div>
    <div class="right">
        <div class="name">
        <asp:Label ID="productNameLabel" runat="server" CssClass="product-labeln" ></asp:Label> <br />
        <asp:Label ID="productDescLabel" runat="server" CssClass="product-labeld" ></asp:Label> <br /><br />
        <asp:Label ID="productPriceLabel" runat="server" CssClass="product-labelp"></asp:Label>

            
        </div>
        <h2 class="s">SIZE</h2>
        <div class="styled-dropdown">
        <select id="sizeDropdown" class="dropdown">
            <option value="00">00</option>
            <option value="0">0</option>
            <option value="2">2</option>
            <option value="4">4</option>
            <option value="6">6</option>
            <option value="8">8</option>
            <option value="10">10</option>
            <option value="12">12</option>
            <option value="14">14</option>
            <option value="16">16</option>
            <option value="18">18</option>
            <option value="20">20</option>
            <option value="22">22</option>
            <option value="24">24</option>
            <option value="26">26</option>
            <option value="28">28</option>
            <option value="30">30</option>
        </select>
        <span class="dropdown-arrow"></span>
    </div>
        <br><br> 
        <div class="para">
            <p>Add your personalization (optional) Please enter your waist, bust, underbust measurements and your full height for Alterations. Please Select a Size Above Before Adding Alterations or Customizations</p>
        </div>
       
        <input id="subscribe-input" type="text" placeholder="Add your personalization(optional)" class="txtbox">
        <br><br><br><br><br> <br><br> <br><br> <br><br> <br><br> 
        <div class="parag">
            <p>
                1. Length<br>Measure from the top of your shoulder (center, where a seam would be placed) to the hem. <br> 
                2. Bust<br>To get an accurate bust measurement, place the measuring tape under your arms and around the fullest section of your bust.

<br> 
                3. Waist<br>Your waist measurement is taken from your narrowest point located under your navel.

<br>
                4. Hip<br>Your hip measurement should be taken 8 inches below your waist measurement.
            </p>
        </div>
 
    </div>
   </div>

   <div class="datesss">
    <div class="sad">
        <h3>SELECT A DATE</h3>
    </div>
   </div>
   <div class="datebutton">
    <div class="datebutton2">
        <div class="datebutton3">
            <div class="label">Start</div>
            <input id="subscribe-input1" type="text" placeholder="dd/mm/yy" class="txtbox">
        </div>
        <div class="datebutton3">
            <div class="label">Return</div>
            <input id="subscribe-input1" type="text" placeholder="dd/mm/yy" class="txtbox">
        </div>
        <div class="datebutton3">
            <div class="label">Rate</div>
            <input id="subscribe-input1" type="text" placeholder="₱6,899.00" class="txtbox">
        </div>
    </div>
    </div>
    <div class="lastt">
        <div class="last2">
            <div class="last3">
                <button class="firstb">Add to cart</button>
            </div>
            <div class="last3">
                <asp:HyperLink ID="lnkBookNow" runat="server" CssClass="buts"><button class="firstb">Book Now</button></asp:HyperLink>

            </div>
        </div>
    </div>

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
    <p>Terms and Condition   |   Privacy Policy   |  &copy; 2024 All rights reserved </p>
    
    <div class="legal__links">
      <span> <img scr="facebook (1).png" /> <span class="heart"></span> </span>
    </div>
  </div>
</footer>








         <!--END-->





   <!--JAVASCRIPTS-->



        <script>
document.getElementById("search-icon").addEventListener("click", function() {
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
    </html>     