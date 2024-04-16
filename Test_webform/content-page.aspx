
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DRESSERVE</title>
    <link href="https://fonts.cdnfonts.com/css/kapakana" rel="stylesheet">
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <script src="javascripts/JavaScript.js"></script>
        <link rel="stylesheet" type="text/css" href="CSS/content-page.css">
        <link rel="stylesheet" type="text/css" href="CSS/Carousel.css">  
        <link rel="stylesheet" type="text/css" href="CSS/for_him_for_her.css">
        <link rel="stylesheet" type="text/css" href="CSS/Collection-list.css">  
        <link rel="stylesheet" type="text/css" href="CSS/Quote.css">  
        <link rel="stylesheet" type="text/css" href="CSS/inquire-view.css">  
        <link rel="stylesheet" type="text/css" href="CSS/Footer.css">  
        <link type="text/css" href="CSS/search-box-animation.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1">

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
              max-width: 350px;
               
                margin-left: 30px;
                margin-right: 30px;
                text-align: center; /* Center align content */
            }
            
            .grid-item img {
                max-width: 100%; /* Ensure images don't exceed their container */
                
                margin-bottom: 10px; /* Add space between image and label */
            }
            
            .label {
                font-size: 30px; /* Font size for labels */
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
        </style>
</head>
    
    <body>

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
        <a href="#home"><img class="icon" src="shopping-bag.png" alt="Shopping Bag"></a>
        <a href="#home"><img class="icon" src="user-logo.png" alt="User"></a>
        <a href="#home"><img class="icon" id="burger" src="hamburger.png" alt="Menu"></a>   

</div>
    </div>
        <div class="h">
        <h2 class="mc"> WOMEN'S COLLECTIONS</h2><br>
        <h4 class="cf"> C &nbsp;O &nbsp;L&nbsp; L&nbsp; E&nbsp; C&nbsp; T&nbsp; I&nbsp; O&nbsp; N&nbsp;   &nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;   F &nbsp;I &nbsp;T &nbsp;T &nbsp;I &nbsp;N&nbsp; G </h4>
    </div>

  <!-- END -->  

 
<div class="grid-wrapper"> 
 
  <div class="grid-container">
   
      <div class="grid-item">
        <img src="Scarlet Sangria cocktail dress.jpeg" alt="Image 1">
        <div class="label">Scarlet Sangria cocktail dress
        </div>
        <br>
        <div class="label">₱6,899.00
        </div>
    </div>

    <div class="grid-item">
        <img src="Ethereal Prism Poise cocktail dress.jpeg" alt="Image 2">
        <div class="label">Ethereal Prism Poise cocktail dress</div>
        <br>
         <div class="label">₱6,899.00
    </div>
      

</div>
    <div class="grid-item">
        <img src="Midnight Shimmer Sonata cocktail dress.jpeg" alt="Image 3">
        <div class="label">Midnight Shimmer Sonata cocktail dress</div>
        <br>
<div class="label">₱10,200.00
</div>
    </div>

  </div>
    <!--
    <div class="grid-item">
        <img src="Midnight Shimmer Sonata cocktail dress.jpeg" alt="Image 4">
        <div class="label">Label 4</div>
    </div>
      
    <div class="grid-item">
        <img src="Peony Princess Cocktail Dress.jpeg" alt="Image 5">
        <div class="label">Label 5</div>
    </div>
    <div class="grid-item">
        <img src="Scarlet Sangria cocktail dress.jpeg" alt="Image 6">
        <div class="label">Label 6</div>
    </div>
    <div class="grid-item">
        <img src="Cherry Charisma Silk Cocktail Dress.jpeg" alt="Image 7">
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
          <a href="#">About Us</a>
        </li>

        <li>
          <a href="#">Contact Us</a>
        </li>
            
        <li>
          <a href="#">FAQs</a>
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
      <!-- <span> <img src="facebook (1).png" /> <span class="heart"></span> </span> -->
    </div>
  </div>
</footer>








         <!--END-->
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
        </script>


    </body>
    </html>