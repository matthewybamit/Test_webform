<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login-page.aspx.cs" Inherits="Test_webform.WebForm1" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LOGIN</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="javascripts/JavaScript.js"></script>
    <link rel="stylesheet" type="text/css" href="CSS/login-page.css">

</head>
<body>

    

    

    <form id="form1" runat="server">

    <div id="login_auth">
        <img src="login_form.png" style="display: inline-block;" />
        <div id="Google">
            <asp:ImageButton ID="GoogleImage" ImageUrl="g sign in.png" runat="server" OnClick="Login" />
        </div>
        <div id="Facebook">
            <asp:ImageButton ID="FacebookImage" ImageUrl="fb.png" runat="server" OnClick="FBLogin" />
        </div>
        <asp:Panel ID="pnlProfile" runat="server" Visible="false">
            <asp:Panel ID="pnlFaceBookUser" runat="server" Visible="false">

                <!-- <table>
        <tr>
            <td rowspan="6" valign="top">
                <asp:Image ID="ProfileImage" runat="server" Width="50" Height="50" />
            </td>
        </tr>
        <tr>
    <td>
        ID:
        <asp:Label ID="lblId" runat="server" Text=""></asp:Label>
        </td>
        </tr>
        <tr>
            <td>
                Name: 
                <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
            </td>
        </tr>
         <tr>
            <td>
                Email: 
                <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
    <td>
        <asp:Button Text="Logout" runat="server" OnClick="Logout" />
            </td>
    </tr>
    </table> -->


            </asp:Panel>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
