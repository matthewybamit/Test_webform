    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Landing-page.aspx.cs" Inherits="Test_webform.Test_webform" %>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>DRESSERVE</title>
        <link href="https://fonts.cdnfonts.com/css/kapakana" rel="stylesheet">
       <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
         <script src="javascripts/JavaScript.js"></script>
        <link rel="stylesheet" type="text/css" href="CSS/StyleSheet1 - Copy.css">
         <link rel="stylesheet" type="text/css" href="CSS/Carousel.css">  
        <link rel="stylesheet" type="text/css" href="CSS/for_him_for_her.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
   


    <body>

    <!--TOP NAV-->

        <div class="topnav visible" id="topnav">
        <!-- LOGO -->   
        <img class="logo" src="Dresserve.png" alt="">
        <a class="active" href="#home">Dresserve</a>
        <!-- END -->  

        <!--NAV ICON-->
        <div class="topnav-right">
            <a href="#home"><img class="icon" id="search-bar" src="magnifying-glass.png" alt="Search"></a>
            <a href="#home"><img class="icon" src="shopping-bag.png" alt="Shopping Bag"></a>
            <a href="#home"><img class="icon" src="user-logo.png" alt="User"></a>
            <a href="#home"><img class="icon" id="burger" src="hamburger.png" alt="Menu"></a>
            <a href="#home"><img class="hamburger-menu" src="hamburger.png" alt="Menu"></a>
        </div>
          <!-- END -->  

    </div>

  <!-- END -->  

    <!--Courosel-->
   
       <div class="container">
        <div class="slides"> 
            <a href="#"><img src="2.jpg" alt="Slide 1"></a>
            <a href="#"><img src="2.jpg" alt="Slide 2"></a>
            <a href="#"><img src="3.jpg" alt="Slide 3"></a>
        </div>
        <div class="sliders">
            <a class="slider" data-slide="0"></a>
            <a class="slider" data-slide="1"></a>
            <a class="slider" data-slide="2"></a>
        </div>
    </div>

    
    <!--END-->


<!--FOR HIM FOR HER-->

  <div class="container">
  <div class="box" id="box1">
    <img src="Dresserve1.png" id="image1" alt="Image 1">
    <a href="#" class="box-link">FOR HIM</a> 
  
  </div>
  <div class="box">   
    <img src="Dresserve1.png" id="image2" alt="Image 2">
    <a href="#" class="box-link">FOR HER</a> 
   
  </div>
</div>

<!--END-->

<!--COLLECTION LIST-->

    </body>


    </html>