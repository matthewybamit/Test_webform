    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Landing-page.aspx.cs" Inherits="Test_webform.Test_webform" %>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>DRESSERVE</title>
        <link href="https://fonts.cdnfonts.com/css/kapakana" rel="stylesheet">
       <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
         <script src="javascripts/JavaScript.js"></script>
        <link rel="stylesheet" type="text/css" href="CSS/StyleSheet1 - Copy.css">
         <link rel="stylesheet" type="text/css" href="CSS/Carousel.css">  
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
   


    <body>

    <!--TOP NAV-->

        <div class="topnav visible" id="topnav">
        <!-- LOGO -->
        <img class="logo" src="Dresserve.png" alt="">
        <a class="active" href="#home">Dresserve</a>
        <!--NAV ICON-->
        <div class="topnav-right">
            <a href="#home"><img class="icon" src="magnifying-glass.png" alt="Search"></a>
            <a href="#home"><img class="icon" src="shopping-bag.png" alt="Shopping Bag"></a>
            <a href="#home"><img class="icon" src="user-logo.png" alt="User"></a>
            <a href="#home"><img class="icon" src="hamburger.png" alt="Menu"></a>
            <a href="#home"><img class="hamburger-menu" src="hamburger.png" alt="Menu"></a>
        </div>
    </div>
    <!--TOP NAV-->

    <!--Courosel-->
   
       <div class="container">
        <div class="slides"> 
            <a href="#"><img src="1.png" alt="Slide 1"></a>
            <a href="#"><img src="2.jpg" alt="Slide 2"></a>
            <a href="#"><img src="3.jpg" alt="Slide 3"></a>
        </div>
        <div class="sliders">
            <a class="slider" data-slide="0"></a>
            <a class="slider" data-slide="1"></a>
            <a class="slider" data-slide="2"></a>
        </div>
    </div>

    
    <!--Courosel-->
 


    </body>


    </html>