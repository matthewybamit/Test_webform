<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Book.aspx.cs" Inherits="Test_webform.Book" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head> 
<body>
    <form runat="server">
        <input type="text" id="uidInput" runat="server" />
        <input type="text" id="usernameInput" runat="server" />
        <input type="text" id="emailInput" runat="server" />
        <input type="text" id="profilePictureInput" runat="server" />
        

        <asp:Button ID="insertButton" runat="server" Text="Insert" OnClick="InsertButton_Click" />
    </form>

    <script>
        // Retrieve UID and email from session storage
        const uid = sessionStorage.getItem('uid');
        const email = sessionStorage.getItem('email');
        const profilePicture = sessionStorage.getItem('profilePicture');
        const username = sessionStorage.getItem('username');

        // Update the input fields with the UID and email values
        document.getElementById('uidInput').value = uid;
        document.getElementById('emailInput').value = email;
        document.getElementById('profilePictureInput').value = profilePicture;
        document.getElementById('usernameInput').value = username;
    </script>
</body>
</html>
