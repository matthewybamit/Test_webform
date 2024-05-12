<%@ Page Title="DRESSERVE" Async="true" Language="C#" AutoEventWireup="true" CodeBehind="billing-methods.aspx.cs" Inherits="Test_webform.billing" %>

<form id="form1" runat="server">
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:ImageButton ID="btnPayment" ImageUrl="Paypal.png" runat="server" OnClick="btnPayment_Click" style="background-color: wheat; width: 150px; background-size: cover; border-radius: 10px;"/>
    <asp:ImageButton ID="Gcash" ImageUrl="gcash-paymaya.png" runat="server" OnClick="btnGcash_Click" style="background-color: wheat; width: 150px; height: 50px; background-size: cover; object-fit: contain; border-radius: 10px;"/>
</form>



