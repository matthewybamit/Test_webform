dcc<html xmlns="http://www.w3.org/1999/xhtml">
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
        height: 300px;
        border-color: black;
        border-radius: 2%;
    }
    .right {
   
    text-align: center;
    
    }
    .label1 {
        font-size: 30px;
        font-family: "Barlow Semi Condensed", sans-serif;
        margin-bottom: 20px;
    }
    .brown {
        background-color: #2E2118;
        height: 470px;
        width: 370px;
       
    }
    .center {
      text-align: center;
      justify-content: center;
      display: flex;
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
</div>

  <h2 class="contact">Contact us</h2>

<div class="container">
    <div class="left">
    
    <div class="name">
        <div class="Names">Name:</div>
        <input id="subscribe-input" type="text" placeholder="Your Name" class="txtbox">
    </div>
    
    <div class="email">
        <div class="mail">Email:</div>
        <input id="subscribe-input" type="text" placeholder="Your Email" class="txtbox">
    </div>
    
    <div class="message">
        <div class="msg">Message:</div>
        <input id="subscribe-input-msg" type="text" class="txtbox">
    </div>
</div>
<div class="right">
 <div class="label1">SAMPLE LOCATION/DETAILS</div>
 <div class="center">
  <div class="brown">
  </div>
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