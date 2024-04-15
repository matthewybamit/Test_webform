<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login-page.aspx.cs" Inherits="Test_webform.WebForm1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LOGIN</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="javascripts/JavaScript.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="CSS/login-page.css">
</head>
<body>
<div class="container">
    <div class="login-container">
        <div class="logo">
            <img src="logo.png" alt="Logo">
            <h1>Dresserve</h1>
        </div>
        <div class="login">
            <div class="login-content">
                <h2 class="text-center">Log in</h2>
                <div class="divider">
                    <hr>
                    <p>with</p>
                    <hr>
                </div>
                <div class="social-icons">
                    <form id="form1" runat="server">
                    <asp:ImageButton ID="GoogleImage" ImageUrl="googlelogo1.png" runat="server" OnClick="Login" />
                    <asp:ImageButton ID="FacebookImage" ImageUrl="fblogo1.png" runat="server" OnClick="FBLogin" />
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
