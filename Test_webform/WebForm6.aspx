﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm6.aspx.cs" Inherits="Test_webform.WebForm6" %>

<!DOCTYPE html>

﻿<html xmlns="http://www.w3.org/1999/xhtml">
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
      .contact {
        margin-top: 150px;
        font-size: 60px;
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
      }
      .name {
        margin-bottom: 20px;
        padding-left: 100px;
      }
      .Names {
        margin-bottom:20px;
        
      }
      .email {
        margin-bottom: 20px;
        padding-left: 100px;
        padding-right: 0px;
      }
      .mail {
        margin-bottom: 20px;
      }
      .message {
        margin-bottom: 20px;
        padding-left: 100px;
      }
      .msg{
        padding-bottom: 20px;
      }
    #subscribe-input {
        width: 600px;
        border-radius: 2%;
    }
    
    #subscribe-input-msg {
        width: 600px;
        height: 200px;
        border-color: black;
        border-radius: 2%;
    }
    .right {
   padding-top: 10%;
  
    
    }
    .label1 {
        font-size: 30px;
        font-family: "Kaisei Opti", serif;
        margin-bottom: 20px;
    }
    .brown {
        
        height: 100px;
        width: 370px;
       
    }
    
    input[type="date"] {
        background-color: #2E2118;
            border: 1px solid #ccc; /* Example border */
            border-radius: 5px; /* Example border radius */
            padding: 5px; /* Example padding */
            color: white;
            height: 50px;
            width: 300px;
            text-align: center;
            font-size: 30px;
            font-family: "Barlow Semi Condensed", sans-serif;
}
input[type="date"]::before {
            background-color: #2E2118;
        }
        input[type="time"] {
    font-size: 30px; /* Adjust font size */
    width: 300px; /* Adjust width */
    font-family: "Kaisei Opti", serif;
  }
  .sub {
    text-align: center;
    margin-bottom: 40px;
  }
  #buts {
    font-weight: 600;
    font-size: 20px;
    width: 200px;
    height: 50px;
    text-align: center;
    background-color: #C7B1A6;
 
    border-color: transparent;
    font-family: "Barlow Semi Condensed", sans-serif;
  }
    </style>
    
      </head>
   




    <body>

   <!--TOP NAV-->
<div class="topnav visible" id="topnav">
    <!-- LOGO -->   
    <img class="logo" src="Dresserve.png" alt="">
    <a class="active" href="landing.html">Dresserve</a>
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
<!--FORM-->
    <form id="form1" runat="server">
        <h2 class="contact">Book for Fitting</h2>

        <div class="container">
            <div class="left">
                <asp:HiddenField ID="productID" runat="server" />
                <asp:HiddenField ID="uidInput" runat="server" />
                <div class="mail">Email</div>
                <asp:TextBox ID="emailInput" runat="server" CssClass="txtbox" placeholder="Your Email"></asp:TextBox>
                <div class="mail">Contact Number</div>
                <asp:TextBox ID="contactnum" runat="server" CssClass="txtbox" placeholder="Your Contact"></asp:TextBox>
                <div class="msg">Message:</div>
                <asp:TextBox ID="message" runat="server" CssClass="txtbox"></asp:TextBox>
            </div>
            <div class="right">
                <div class="label1">Select Date</div>
                <div class="brown">
                    <asp:TextBox ID="date" runat="server" type="date" placeholder="Your Email"></asp:TextBox>
                </div>
                <div class="label1">Select Time</div>
                <asp:TextBox ID="meetingTime" runat="server" type="time" placeholder="Your Email"></asp:TextBox>
            </div>
        </div>
        <div class="sub">
            <asp:Button ID="buts" runat="server" Text="SUBMIT" CssClass="buts" OnClick="InsertBooking" />
        </div>
    </form>
 <!--FORM END-->


 
          



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
            const uid = sessionStorage.getItem('uid');
            const email = sessionStorage.getItem('email');

            document.getElementById('uidInput').value = uid;
            document.getElementById('emailInput').value = email;
        </script>


    </body>
</html>