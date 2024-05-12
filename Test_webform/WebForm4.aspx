<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="Test_webform.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
         <link rel="stylesheet" href="CSS/Carousel.css"/>  
         <link rel="stylesheet" href="CSS/for_him_for_her.css"/>
         <link rel="stylesheet" href="CSS/Collection-list.css"/>  
         <link rel="stylesheet" href="CSS/Quote.css"/>  
         <link rel="stylesheet" href="CSS/inquire-view.css"/>  
         <link rel="stylesheet" href="CSS/Footer.css"/>  
         <link type="text/css" href="CSS/search-box-animation.css" rel="stylesheet" />
        <title>DRESSERVE</title>
        <link href="https://fonts.cdnfonts.com/css/kapakana" rel="stylesheet"/>
       <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
         <script src="javascripts/JavaScript.js"></script>
         <link rel="stylesheet" href="CSS/Copy.css"/>
         <link href="CSS/heshim.css" rel="stylesheet" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
<link href="https://fonts.googleapis.com/css2?family=Barlow+Semi+Condensed:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet"/>

        <style>
            @font-face {
    font-family: 'Kaisei Opti';
    src: url('path/to/kaisei-opti.woff2') format('woff2'), /* Modern Browsers */
    url('path/to/kaisei-opti.woff') format('woff'); /* Older Browsers */
    font-weight: normal;
    font-style: normal;
}

            .grid-wrapper {
            display: flex;
            justify-content: center; /* Center horizontally */
            }
            

            .grid-container {
                display: grid;
                grid-template-columns: repeat(3, 1fr); /* Three columns */
                grid-template-rows: repeat(3, 1fr); /* Three rows */
                gap: 10px; /* Gap between grid items */
                
                
            }
            
            .grid-item {
                width: 320px;
                transition: transform .2s;
                margin-left: 30px;
                margin-right: 30px;
                text-align: center; /* Center align content */
            }
            .grid-item:hover {
                  -ms-transform: scale(1.5); /* IE 9 */
                  -webkit-transform: scale(1.5); /* Safari 3-8 */
                  transform: scale(1.025); 
                }
            
            .grid-item img {
                max-width: 100%; /* Ensure images don't exceed their container */
                
                margin-bottom: 10px; /* Add space between image and label */
            }
            
            .label {
                font-size: 30px; /* Font size for labels */
            }
            .labelprice {
                font-size: 23px;
            }
            .labeldesc {
             font-size: 20px;
             color: gray;
            }
            .h {
               margin: auto;
               width: 370px;
            }
            .mc {
                font-size: 30px;
                
                
                margin-top: 100px;
                text-align: center;
                
            
            }
            .cf{
                text-align: center;
                font-family: "Barlow Semi Condensed", sans-serif;
            }
            .h span {
                letter-spacing: 15px;
                
            }
            /* Style for the dropdown container */
            .dropdown-container {
                /* Position the container relative */
                position: relative;
                 margin-left: 1070px;
                 margin-bottom: 25px;
            }

            /* Style for the dropdown */
            .styled-dropdown {
                /* Position the dropdown absolute */
                /* Position it at the top right corner of the container */

                /* Add padding to the dropdown */
                padding: 8px;
                /* Set the background color */
                background-color: #FAEBDB;
                /* Set the border */
                border: 1px solid #333;
                /* Add rounded corners */
                border-radius: 5px;
                /* Set font size and color */
                font-size: 12px;
                color: #333;
                /* Add some space between the text and the dropdown arrow */
                padding-right: 30px; 
                /* Set cursor to pointer to indicate it's clickable */
                cursor: pointer;
                /* Ensure it appears above other content */
                z-index: 1;
            }

            /* Style for dropdown options */
            .styled-dropdown option {
                /* Set font size and color */
                font-size: 12px;
                color: #333;
                /* Add padding */
                padding: 8px;
            }

            /* Style for when dropdown is hovered */
            .styled-dropdown:hover {
                /* Change background color */
                background-color: #FAEBDB;
            }

            /* Style for when dropdown is focused */
            .styled-dropdown:focus {
                /* Add box shadow */
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
                /* Change border color */
                border-color: #fff;
            }

            /* Style for when dropdown arrow */
            .styled-dropdown:after {
                /* Position the arrow */
                content: '\25BC';
                position: absolute;
                top: 50%;
                right: 10px;
                /* Transform to center vertically */
                transform: translateY(-50%);
                /* Adjust color and size */
                color: #666;
                font-size: 14px;
            }

            /* Style for when dropdown arrow is hovered */
            .styled-dropdown:hover:after {
                /* Adjust color */
                color: #333;
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
  <img class="icon" src="magnifying-glass.png" alt="Search"/>
</a>
<div id="search-box">
  <input type="text" id="search-input" placeholder="Enter your search"/>
</div>
        <a href="#home"><img class="icon" src="shopping-bag.png" alt="Shopping Bag"></a>
        <a href="#home"><img class="icon" src="user-logo.png" alt="User"></a>
        <a href="#home"><img class="icon" id="burger" src="hamburger.png" alt="Menu"></a>   

</div>
    </div>
    <!-- END -->  
    <div class="h">
        <h2 class="mc">COLLECTION</h2><br>
        <h4 class="cf"> C &nbsp;O &nbsp;L&nbsp; L&nbsp; E&nbsp; C&nbsp; T&nbsp; I&nbsp; O&nbsp; N&nbsp;   &nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;   F &nbsp;I &nbsp;T &nbsp;T &nbsp;I &nbsp;N&nbsp; G </h4>
    </div>
</div>

  <!-- END -->  
   
 
 <form id="form1" runat="server">


     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

     <div class="dropdown-container">
    <asp:DropDownList ID="ddlGender" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlGender_SelectedIndexChanged" CssClass="styled-dropdown">
    <asp:ListItem Text="Default or All" Value=""></asp:ListItem>
    <asp:ListItem Text="Him" Value="Him"></asp:ListItem>
    <asp:ListItem Text="Her" Value="Her"></asp:ListItem>
</asp:DropDownList>

<asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" CssClass="styled-dropdown">
    <asp:ListItem Text="Default or All" Value=""></asp:ListItem>
    <asp:ListItem Text="Wedding Gowns" Value="Wedding Gowns"></asp:ListItem>
    <asp:ListItem Text="Debut Gowns" Value="Debut Gowns"></asp:ListItem>
    <asp:ListItem Text="Formal" Value="Formal"></asp:ListItem>
    <asp:ListItem Text="Dresses" Value="Dresses"></asp:ListItem>
</asp:DropDownList>

</div>

    <ContentTemplate>
        <div class="grid-wrapper">
            <div class="grid-container">
                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            </div>
        </div>
    </ContentTemplate>

        <asp:UpdatePanel ID="updatePanel" runat="server">
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="ddlGender" EventName="SelectedIndexChanged" />
        <asp:AsyncPostBackTrigger ControlID="ddlCategory" EventName="SelectedIndexChanged" />
    </Triggers>
    <ContentTemplate>
        <div class="grid-wrapper">
            <div class="grid-container">
                <asp:PlaceHolder ID="gridProducts" runat="server"></asp:PlaceHolder>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
    </form>
    <!--<div class="grid-item">
        <img src="heshim/FlatFrontLinensuit.png" alt="Image 4">
        <div class="label">Label 4</div>
    </div>
    <div class="grid-item">
        <img src="heshim/LuxeBlackWoolBlendSuit.png" alt="Image 5">
        <div class="label">Label 5</div>
    </div>
    <div class="grid-item">
        <img src="heshim/NavyBlueTwo-PieceSuit.png" alt="Image 6">
        <div class="label">Label 6</div>
    </div>
    <div class="grid-item">
        <img src="heshim/ShawlLapelBlackTuxedo.png" alt="Image 7">
        <div class="label">Label 7</div>
    </div>
    <div class="grid-item">
        <img src="heshim/SlimFitGreySuit.png" alt="Image 8">
        <div class="label">Label 8</div>
    </div>
    <div class="grid-item">
        <img src="image9.jpg" alt="Image 9">
        <div class="label">Label 9</div>
    </div> -->
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
</html>