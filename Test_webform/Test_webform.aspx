<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test_webform.aspx.cs" Inherits="Test_webform.Test_webform" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Introduction</title>
    <style>
        body {
            margin: 0;
            padding: 0;
        }

        #form1 {
            height: 600px;
            width: 500px;
            background-color: lightgreen;
            margin: 0 auto; 
            padding: 20px; 
        }

        #button {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        #button_size {
            font-size: 100px;
            padding: 10px 20px;
            overflow: hidden;
        }
         .topnav img {
            max-height: 50px; /* Adjust as needed */
            max-width: 100px; /* Adjust as needed */
            vertical-align: middle;
        }


        .topnav {
            background-color: #2E2118;
            padding: 10px 20px;
            margin-bottom: 30px;
            overflow: hidden; /* Added overflow to contain floated elements */
        }

        .topnav a {
            color: #f2f2f2;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 18px;
        }

        .topnav a:hover {
            background-color: #ddd;
            color: black;
        }

        .topnav a.active {

            margin-left: 5px;
            color: white;
        }

        .topnav-right {
            float: right;
            padding-top:inherit;
            padding-bottom: inherit;
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <div class="topnav">
        <img src="Dresserve.png" alt="">
        <a class="active" href="#home">DRESSERVE</a>
        <div class="topnav-right">
            <a href="#search">Search</a>
            <a href="#about">About</a>
        </div>
    </div>

    <form id="form1" runat="server">
        <div id="button">
            <button id="button_size">HELLO</button>
        </div>
    </form>
</body>
</html>