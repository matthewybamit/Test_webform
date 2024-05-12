<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user-profile.aspx.cs" Inherits="Test_webform.user_profile" %>

<!DOCTYPE html>

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
        <link href="CSS/profile.css" rel="stylesheet" />
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
        <a href="Book.aspx"><img class="icon" id="burger" src="hamburger.png" alt="Menu"></a>   

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

    <input type="text" id="uidInput" />
    <form id="form1" runat="server">
        <div class="container-info">
            <div class="texthead">YOUR ACCOUNT</div>
            <div class="container-uid">
                <p id="user-uid"></p>
            </div>
            <div class="profile-container">
                <div class="profile">
                    <img src="" id="profile-picture" />
                </div>
            </div>
            <hr class="divider" />
            <div class="container-name">
                <p id="profile-name"></p>
            </div>
            <div class="container-email">
                <p id="user-email"></p>
            </div>
            <div class="logout-btn">
                <button id="btnLogout" onclick="logout()">Logout</button>
            </div>
        </div>
    </form>
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

      <script>
          // Retrieve UID from session storage
          const uid = sessionStorage.getItem('uid');

          // Update the input field with the UID value
          document.getElementById('uidInput').value = uid;
      </script>
<script>
    window.onload = function () {
        // Retrieve user data from session storage
        const uid = sessionStorage.getItem('uid');
        const username = sessionStorage.getItem('username');
        const email = sessionStorage.getItem('email');
        const profilePicture = sessionStorage.getItem('profilePicture');

        // Check if any of the necessary session data is missing
        if (!uid || !username || !email || !profilePicture) {
            redirectToLogin();
            return; // Stop further execution
        }

        // Display the data in your HTML elements
        document.getElementById('user-uid').textContent = uid; // Display UID
        document.getElementById('profile-name').textContent = username;
        document.getElementById('profile-picture').src = profilePicture;
        document.getElementById('user-email').textContent = email; // Display email

        // Send user data to server-side code for database insertion
        sendUserDataToServer(uid, username, email, profilePicture);
    };

    function redirectToLogin() {
        window.location.href = 'login-page.aspx';
    }

    // Function to logout
    function logout() {
        sessionStorage.clear(); // Clear session storage
        clearAllCookies();
        window.location.href = 'login-page.aspx'; // Redirect to login page
    }

    function clearAllCookies() {
        const cookies = document.cookie.split(';');

        for (let i = 0; i < cookies.length; i++) {
            const cookie = cookies[i].trim(); // Trim the cookie to remove leading spaces
            const eqPos = cookie.indexOf('=');
            const name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
            document.cookie = `${name}=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;`;
        }
    }

</script>
        <script src="javascripts/JavaScript.js"></script>
    <script src="javascripts/profile.js"></script>
</body>
</html>
