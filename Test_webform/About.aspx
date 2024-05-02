<%@ Page Title="About" Language="C#"  AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Test_webform.About" %>

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
      .about {
        margin-top: 150px;
        font-size: 60px;
        text-align: center;
        font-family: "Kaisei Opti", serif;
        font-weight: 10;
      }
      .paragraph {
        margin: 150px;
        text-align: center;
        font-family: "Barlow Semi Condensed", sans-serif;
        font-weight: 400;
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
</div>

  <h2 class="about">About us</h2>
  <p class="paragraph">
    Welcome to Dresserve, your premier destination for renting stunning dresses for any occasion. At Dresserve, we believe that fashion should be accessible, 
    <br>sustainable, and effortless. Our mission is to provide a curated collection of high-quality dresses that empower individuals to look and feel their best without the 
    <br>commitment of ownership.
<br><br><br>
    Dresserve began as a passion project among friends who shared a common frustration – the lack of affordable, convenient, and sustainable options in the 
    <br>fashion industry. We realized that the traditional model of purchasing expensive dresses for special occasions was not only financially burdensome but also 
    <br>environmentally unsustainable. Determined to make a change, we set out to create Dresserve – a platform that offers a curated selection of high-quality dresses for rent, accessible to everyone.
    <br><br><br>
    At Dresserve, we pride ourselves on offering a diverse selection of dresses for all genders, body types, and style preferences. Whether you're attending a wedding, 
    <br>prom, gala, or any other special event, we have the perfect dress to suit your needs. From elegant evening gowns to chic cocktail dresses, our curated collection features the latest trends and timeless classics from top designers and brands.

  </p>


  

  <!--QUOTE/SHOP-->

  
  <div class="container-quote">
    <img src="gown.png" alt="Quote image" class="quote-image" />
    <div class="quote">
        <p id="line-1">Once in a Lifetime Event</p>
        <p id="line-2">Let us show you what you Deserve</p>      
    </div>
     <a href="All-content.aspx">  <button class="shop-now">Shop Now</button></a>
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
          <a href="About.aspx">About Us</a>
        </li>

        <li>
          <a href="Contact.aspx">Contact Us</a>
        </li>
            
        <li>
          <a href="faqs.aspx">FAQs</a>
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