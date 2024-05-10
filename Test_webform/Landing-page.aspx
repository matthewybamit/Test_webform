﻿   <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Landing-page.aspx.cs" Inherits="Test_webform.Test_webform" %>

﻿ 


<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>DRESSERVE</title>
        <link href="https://fonts.cdnfonts.com/css/kapakana" rel="stylesheet">
       <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
         <script src="javascripts/JavaScript.js"></script>
            <link rel="stylesheet" type="text/css" href="CSS/StyleSheet1 - Copy.css"/>
            <link rel="stylesheet" type="text/css" href="CSS/Carousel.css">  
            <link rel="stylesheet" type="text/css" href="CSS/for_him_for_her.css"/>
            <link rel="stylesheet" type="text/css" href="CSS/Collection-list.css"/>  
            <link rel="stylesheet" type="text/css" href="CSS/Quote.css"/>  
            <link rel="stylesheet" type="text/css" href="CSS/inquire-view.css"/>  
            <link rel="stylesheet" type="text/css" href="CSS/Footer.css"/>  
            <link href="CSS/search-box-animation.css" rel="stylesheet" />
        <link href="CSS/Shopping-cart.css" rel="stylesheet" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
   




    <body>
   
   <!--TOP NAV-->
<div class="topnav visible" id="topnav">
    <!-- LOGO -->   
    <a class="active" href="Landing-page.aspx">  <img class="logo" src="Dresserve.png"> Dresserve
  </a>
    <!-- END -->  

    <!--NAV ICON-->
    <div class="topnav-right">
        <a href="#home" id="search-icon">
  <img class="icon" src="magnifying-glass.png" alt="Search">
</a>
<div id="search-box">
  <input type="text" id="search-input" placeholder="Enter your search">
</div>
     <a href="#" id="open-form"><img class="icon" src="shopping-bag.png" alt="Shopping Bag"></a>
        <a href="user-profile.aspx"><img class="icon" src="user-logo.png" alt="User"></a>
        <a href="#home"><img class="icon" id="burger" src="hamburger.png" alt="Menu"></a>   

</div>
    </div>
    <!-- END -->  
</div>

<!-- Cart -->
<div id="cart-overlay" class="cart-overlay">
    <div class="cart">
        <h2>Shopping Cart</h2>
        <div id="cart-items" class="cart-items">
            <!-- Cart items will be added dynamically here -->
        </div>
        <div class="cart-buttons">
            <button id="close-cart" class="close-cart">Close</button>
            <button id="checkout-cart" class="checkout-cart">Checkout</button>
        </div>
    </div>
</div>
<!-- Cart -->



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
    <a href="WebForm4.aspx" class="box-link">FOR HIM</a> 
  
  </div>
  <div class="box">   
    <img src="for-her.jpg" id="image2" alt="Image 2">
    <a href="WebForm4.aspx" class="box-link">FOR HER</a> 
   
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
            <a href="WebForm4.aspx" class="collection-link" id="wedding-link">Wedding Gowns</a>
        </div>
        <div class="collection-item">
            <img src="debut.png" alt="Debut Gowns"  >
            <a href="WebForm4.aspx" class="collection-link" id="debut-link" >Debut Gowns</a>
        </div>
        <div class="collection-item">
            <img src="formal.png" alt="Formal">
            <a href="WebForm4.aspx" class="collection-link" id="formal-link">Formal</a>
        </div>
        <div class="collection-item">
            <img src="dresses.png" alt="Dresses">
            <a href="WebForm4.aspx" class="collection-link" id="dress-link">Dresses</a>
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
     <a href="WebForm4.aspx">  <button class="shop-now">Shop Now</button></a>
</div>


                 <!--INQUIRE/VIEWMORE-->
    
 <div class="Inquire-veiw-container">
  <div class="inquire-box">
    <img src="inquire.jpg" id="inquire-image" alt="inquire-image">
    <p class="inquire-view-link" id="inquire-text">Find Your Piece</p> 
    <a href="inquire.aspx" class="inquire-view-link" id="inquire-id">Inquire</a> 
  </div>
  <div class="inquire-box">   
    <img src="viewmore.jpg" id="view-image" alt="view-image">
    <p class="inquire-view-link" id="view-more-text">Dress For Every Occassion</p> 
    <a href="All-content.aspx" class="inquire-view-link" id="view-more-id">View More</a> 
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
  <a href="https://www.facebook.com/mathew.ybamit.9" target="_blank"><img src="facebook.png" alt="Image 1"> </a>
 <a href="https://www.instagram.com/mathewybamit/" target="_blank"> <img src="photo.png" alt="Image 2" > </a>
 <a href="https://www.facebook.com/mathew.ybamit.9" target="_blank"> <img src="video.png" alt="Image 2"> </a>
  <!-- Add more images as needed -->
  <span class="heart"></span>
</div>
  </div>
</footer>






     
     
         <!--END-->
      <script src="javascripts/JavaScript.js"></script>

    </body>
    </html>
