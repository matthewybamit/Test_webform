 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="Test_webform.WebForm5" %>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>DRESSERVE</title>
        <link href="https://fonts.cdnfonts.com/css/kapakana" rel="stylesheet">
       <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
         <link rel="stylesheet" href="CSS/Copy.css">
         <link rel="stylesheet" href="CSS/Carousel.css">  
         <link rel="stylesheet" href="CSS/for_him_for_her.css">
         <link rel="stylesheet" href="CSS/Collection-list.css">  
         <link rel="stylesheet" href="CSS/Quote.css">  
         <link rel="stylesheet" href="CSS/inquire-view.css">  
         <link rel="stylesheet" href="CSS/Footer.css">  
            <link type="text/css" href="CSS/search-box-animation.css" rel="stylesheet" />
            <link rel="stylesheet" href="CSS/heshim.css">
        <link href="CSS/Shopping-cart.css" rel="stylesheet" />
        <link href="CSS/Webform5.css" rel="stylesheet" />
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

                        /* CSS for the side panel */
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
<form runat="server">

 
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
    <div id="sidePanel" runat="server">
    <!-- Content of the side panel goes here -->
    <!-- You can add whatever content you want to show in the side panel -->
</div>


    <div class="top">
        
    </div> 
   <div class="containss">
    <div class="left">   
        
       <div class="pics">
    <img class="pic" id="productImage" src="" alt="" runat="server">
</div>
        
        <div class="detailsss">
            <h3>DETAILS</h3>
        </div>
        <img class="schartz" src="schart.png" alt="" >
    </div>
    <div class="right">
        <div class="name">
        <asp:Label ID="productNameLabel" runat="server" CssClass="product-labeln" ></asp:Label> <br />
        <asp:Label ID="productDescLabel" runat="server" CssClass="product-labeld" ></asp:Label> <br /><br />
        <asp:Label ID="productPriceLabel" runat="server" CssClass="product-labelp"></asp:Label>

            
        </div>
        <h2 class="s">SIZE</h2>
        <div class="styled-dropdown">
        <select id="sizeDropdown" class="dropdown" runat="server">
            <option value="small">small</option>
            <option value="medium">medium</option>
            <option value="large">large</option>
            <option value="X-large">X-large</option>  
        </select>


        <span class="dropdown-arrow"></span>
    </div>
        <br><br> 
        <div class="para">
            <p>Add your personalization (optional) Please enter your waist, bust, underbust measurements and your full height for Alterations. Please Select a Size Above Before Adding Alterations or Customizations</p>
        </div>
       
        <input id="subscribe-input" type="text" placeholder="Add your personalization(optional)" class="txtbox">
        <br><br><br><br><br> <br><br> <br><br> <br><br> <br><br> 
        <div class="parag">
            <p>
                1. Length<br>Measure from the top of your shoulder (center, where a seam would be placed) to the hem. <br> 
                2. Bust<br>To get an accurate bust measurement, place the measuring tape under your arms and around the fullest section of your bust.

<br> 
                3. Waist<br>Your waist measurement is taken from your narrowest point located under your navel.

<br>
                4. Hip<br>Your hip measurement should be taken 8 inches below your waist measurement.
            </p>
        </div>
 
    </div>
   </div>

<div class="datesss">
    <div class="sad">
        <h3>SELECT A DATE</h3>
    </div>
</div>
<div class="datebutton">
    <div class="datebutton2">
        <div class="datebutton3">
            <div class="label">Start</div>
            <asp:Calendar ID="startCalendar" runat="server" CssClass="txtbox" OnSelectionChanged="Calendar_SelectionChanged"></asp:Calendar>
        </div>
        <div class="datebutton3">
            <div class="label">Return</div>
            <asp:Calendar ID="returnCalendar" runat="server" CssClass="txtbox" OnSelectionChanged="Calendar_SelectionChanged"></asp:Calendar>
        </div>
        <div class="datebutton3">
            <div class="label">Rate</div>
            <asp:TextBox ID="rateTextBox" runat="server" CssClass="txtbox" ReadOnly="true"></asp:TextBox>
        </div>
    </div>
</div>

  
<asp:HiddenField ID="HiddenField1" runat="server" />

           <!--FOOTER -->
    <div class="lastt">
        <div class="last2">


          <div class="last3">


 <asp:Button ID="addToCartButton" runat="server" Text="Add to Cart" OnClientClick="return validateInputs();" OnClick="addToCartButton_Click" />
</div>
            <div class="last3">
                <asp:HyperLink ID="lnkBookNow" runat="server" CssClass="buts"><button class="firstb">Book Now</button></asp:HyperLink>

            </div>
        </div>
    </div>
    <asp:Label ID="lblUID" runat="server" Text=""></asp:Label>

<input type="text" id="uidInput" runat="server" style="display: none;" />

    </form>
         <!--END-->

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


        <script src="javascripts/JavaScript.js"></script>

         <script>// JavaScript function to toggle the side panel
             function toggleCartAndUpdate() {
                 var sidePanel = document.getElementById('sidePanel');
                 sidePanel.classList.toggle('open');
             }
         </script>

<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        var startCalendar = document.getElementById('<%= startCalendar.ClientID %>');
        var returnCalendar = document.getElementById('<%= returnCalendar.ClientID %>');

        startCalendar.addEventListener('change', function () {
            var startDate = startCalendar.value;
            console.log('Start date selected:', startDate);
            // Handle start date selection
        });

        returnCalendar.addEventListener('change', function () {
            var returnDate = returnCalendar.value;
            console.log('Return date selected:', returnDate);
            // Handle return date selection
        });
    });
</script>


    <script type="text/javascript">
        const uid = sessionStorage.getItem('uid');
        document.getElementById('uidInput').value = uid;
     
        window.onload = function () {
            const uid = sessionStorage.getItem('uid');
            if (uid) {
                document.getElementById('<%= HiddenField1.ClientID %>').value = uid;
            }

        };


    </script>




    </body>
    </html>