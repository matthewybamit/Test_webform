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
        <link href="CSS/Add-to-cart.css" rel="stylesheet" />
         <link type="text/css" href="CSS/search-box-animation.css" rel="stylesheet" />
        <link href="CSS/webform4.css" rel="stylesheet" />
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
            /* CSS for the side panel */
#sidePanel {
    z-index: 1;
    position: fixed;
    top: 0;l
    right: -300px; /* Initially hidden off-screen */
    width: 300px;
    height: 100%;
    background-color: #fff; /* Change this to your desired background color */
    transition: right 0.3s ease; /* Add transition for smooth animation */
}

#sidePanel.open {
    right: 0; /* Slide the side panel into view */
}
#sidePanel {
    z-index: 1;
    position: fixed;
    top: 0;
    right: -300px; /* Initially hidden off-screen */
    width: 300px;
    height: 100%;
    background-color: #fff; /* Change this to your desired background color */
    transition: right 0.3s ease; /* Add transition for smooth animation */
}

#sidePanel.open {
    right: 0; /* Slide the side panel into view */
}

.cart-item-image {
    max-width: 100px; /* Adjust the value as needed */
    height: auto; /* Maintain aspect ratio */
}

.cart {
    max-height: 300px; /* Adjust the value as needed */
    overflow-y: auto;
}

.cart-items-container {
    padding-right: 15px; /* Add padding to prevent content from being covered by the scrollbar */
}
        </style>
    </head>
   




    <body>
 <form id="form1" runat="server">

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

<asp:LinkButton ID="toggleButton" runat="server" OnClientClick="toggleCartAndUpdate(); return false;">
    <img class="icon" src="shopping-bag.png" alt="Shopping Bag" />
</asp:LinkButton>
        <a href="user-profile.aspx"><img class="icon" src="user-logo.png" alt="User"></a>
        <a href="#home"><img class="icon" id="burger" src="hamburger.png" alt="Menu"></a>   

</div>
    </div>
    <!-- END --> 
       <!-- END --> 
<div id="sidePanel" runat="server" style="max-height: 100%; overflow-y: auto;">
    <!-- Content of the side panel goes here -->
    <!-- You can add whatever content you want to show in the side panel -->
</div>

    <!-- END -->  
    <div class="h">
        <h2 class="mc">COLLECTION</h2><br>
        <h4 class="cf"> C &nbsp;O &nbsp;L&nbsp; L&nbsp; E&nbsp; C&nbsp; T&nbsp; I&nbsp; O&nbsp; N&nbsp;   &nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;   F &nbsp;I &nbsp;T &nbsp;T &nbsp;I &nbsp;N&nbsp; G </h4>
    </div>
</div>

  <!-- END -->  
   
 



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

         <asp:HiddenField ID="HiddenField1" runat="server" />

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

         <!--END-->
        <script src="javascripts/JavaScript.js"></script>




   <!--JAVASCRIPTS-->




    </body>
</html>