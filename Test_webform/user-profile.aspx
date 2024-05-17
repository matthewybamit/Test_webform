<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user-profile.aspx.cs" Inherits="Test_webform.user_profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>DRESSERVE</title>
        <link href="https://fonts.cdnfonts.com/css/kapakana" rel="stylesheet">
       <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
         <script src="javascripts/JavaScript.js"></script>
            <link rel="stylesheet" type="text/css" href="CSS/StyleSheet1 - Copy.css"/>
            <link rel="stylesheet" type="text/css" href="CSS/Carousel.css"/>  
            <link rel="stylesheet" type="text/css" href="CSS/for_him_for_her.css"/>
            <link rel="stylesheet" type="text/css" href="CSS/Collection-list.css"/>  
            <link rel="stylesheet" type="text/css" href="CSS/Quote.css"/>  
            <link rel="stylesheet" type="text/css" href="CSS/inquire-view.css"/>  
            <link rel="stylesheet" type="text/css" href="CSS/Footer.css"/>  
        <link href="CSS/Shopping-cart.css" rel="stylesheet" />
        <link href="CSS/profile.css" rel="stylesheet" />
            <link href="CSS/search-box-animation.css" rel="stylesheet" />
        <link href="CSS/Shopping-cart.css" rel="stylesheet" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
   




    <body>
      <form runat="server">

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

<asp:LinkButton ID="toggleButton" runat="server" OnClientClick="toggleCartAndUpdate(); return false;">
    <img class="icon" src="shopping-bag.png" alt="Shopping Bag" />
</asp:LinkButton>

        <a href="user-profile.aspx"><img class="icon" src="user-logo.png" alt="User"></a>
        <a href="#home"><img class="icon" id="burger" src="hamburger.png" alt="Menu"></a>   

</div>
    </div>
    <!-- END --> 
    <div id="sidePanel" runat="server">
    <!-- Content of the side panel goes here -->
    <!-- You can add whatever content you want to show in the side panel -->
</div>

<asp:HiddenField ID="HiddenField1" runat="server" />
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
              function toggleCartAndUpdate() {
        // Make an AJAX request to the server-side method to refresh the side panel content
        PageMethods.RefreshSidePanel(onSuccess, onError);
    }

    // Callback function for successful AJAX request
    function onSuccess(result) {
        // Update the side panel with the refreshed content
        document.getElementById("sidePanel").innerHTML = result;
    }

    // Callback function for AJAX request error
    function onError(error) {
        // Handle error (e.g., display an alert)
        alert("An error occurred: " + error.get_message());
    }
</script>


    <script>// JavaScript function to toggle the side panel
        function toggleCartAndUpdate() {
            var sidePanel = document.getElementById('sidePanel');
            sidePanel.classList.toggle('open');
        }
    </script>

<script type="text/javascript">

    window.onload = function () {
        const uid = sessionStorage.getItem('uid');
        if (uid) {
            document.getElementById('<%= HiddenField1.ClientID %>').value = uid;
        }

    };


</script>
 

<script src="javascripts/Logout.js"></script>
<script src="javascripts/user-session.js"></script>
        <script src="javascripts/JavaScript.js"></script>
    <script src="javascripts/profile.js"></script>
</body>
</html>
