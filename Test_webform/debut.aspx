<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="debut.aspx.cs" Inherits="Test_webform.debut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>DRESSERVE</title>
        <link href="https://fonts.cdnfonts.com/css/kapakana" rel="stylesheet">
       <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
         <script src="javascripts/JavaScript.js"></script>
        <link href="CSS/StyleSheet1%20-%20Copy.css" rel="stylesheet" />
        <link href="CSS/Shopping-cart.css" rel="stylesheet" />
        <link href="CSS/search-box-animation.css" rel="stylesheet" />
        <link href="CSS/Footer.css" rel="stylesheet" />
        <link href="CSS/items-responsive.css" rel="stylesheet" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Barlow+Semi+Condensed:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

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
         <a href="user-profile.aspx"><img class="icon" src="user-logo.png" alt="User"></a>
        <a href="#home"><img class="icon" id="burger" src="hamburger.png" alt="Menu"></a>   

</div>
    </div>
    <!-- END -->  
    <div class="h">
        <h2 class="mc"> DEBUT COLLECTION</h2><br>
        <h4 class="cf"> C &nbsp;O &nbsp;L&nbsp; L&nbsp; E&nbsp; C&nbsp; T&nbsp; I&nbsp; O&nbsp; N&nbsp;   &nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;   F &nbsp;I &nbsp;T &nbsp;T &nbsp;I &nbsp;N&nbsp; G </h4>
    </div>
</div>

  <!-- END -->  


<div class="grid-wrapper">
    <div class="grid-container" id="gridContainer" runat="server">
        <!-- Products will be dynamically added here -->
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
      <span> <img scr="facebook (1).png" /> <span class="heart"></span> </span>
    </div>
  </div>
</footer>








         <!--END-->





   <!--JAVASCRIPTS-->


<script src="javascripts/JavaScript.js"></script>

    </body>
    </html>