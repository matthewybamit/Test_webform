﻿ff<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="faqs.aspx.cs" Inherits="Test_webform.faqsspx" %>

<!DOCTYPE html>

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
      .faq {
        margin-top: 150px;
        font-size: 50px;
        text-align: center;
        font-family: "Kaisei Opti", serif;
        font-weight: 10;
       
      }
      .container{
        display: grid;
        grid-template-columns: repeat(2, 1fr)
      
      }
      .left {
     
        padding: 0px;
        padding-left: 100px;
        font-size: 20px;
        padding-right: 100px;
        text-align: justify;
        font-family: "Barlow Semi Condensed", sans-serif;
      }
      
     
   
     .right {
        font-size: 20px;
        padding-left: 100px;
        padding-right: 100px;
        text-align: justify;
        font-family: "Barlow Semi Condensed", sans-serif;
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


  <h2 class="faq">Frequently Asked Questions</h2>

<div class="container">
    <div class="left">
        <div class="q1">
            <h3 class="title1">
                Q: how to place an order
            </h3>
            <p>
                A:To place an order, simply browse our products, select the items you wish to purchase, add them to your cart, and proceed to the checkout page. Follow the prompts to provide your shipping information, select a payment method, and confirm your order.
            </p>
        </div>
        <div class="q2">
            <h3 class="title1">
                Q: how to place an order
            </h3>
            <p>
                A:To place an order, simply browse our products, select the items you wish to purchase, add them to your cart, and proceed to the checkout page. Follow the prompts to provide your shipping information, select a payment method, and confirm your order.
            </p>
        </div>
        <div class="q3">
            <h3 class="title1">
                Q: how to place an order
            </h3>
            <p>
                A:To place an order, simply browse our products, select the items you wish to purchase, add them to your cart, and proceed to the checkout page. Follow the prompts to provide your shipping information, select a payment method, and confirm your order.
            </p>
        </div>
    </div>
    <div class="right">
        <div class="q1">
            <h3 class="title1">
                Q: how to place an order
            </h3>
            <p>
                A:To place an order, simply browse our products, select the items you wish to purchase, add them to your cart, and proceed to the checkout page. Follow the prompts to provide your shipping information, select a payment method, and confirm your order.
            </p>
        </div>
        <div class="q2">
            <h3 class="title1">
                Q: how to place an order
            </h3>
            <p>
                A:To place an order, simply browse our products, select the items you wish to purchase, add them to your cart, and proceed to the checkout page. Follow the prompts to provide your shipping information, select a payment method, and confirm your order.
            </p>
        </div>
        <div class="q3">
            <h3 class="title1">
                Q: how to place an order
            </h3>
            <p>
                A:To place an order, simply browse our products, select the items you wish to purchase, add them to your cart, and proceed to the checkout page. Follow the prompts to provide your shipping information, select a payment method, and confirm your order.
            </p>
        </div>
     </div>
</div>


  

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