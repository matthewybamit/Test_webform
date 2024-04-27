<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="Test_webform.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function validateForm() {
            var productName = document.getElementById("product_name");
            var productPrice = document.getElementById("product_price");
            var productDesc = document.getElementById("product_desc");
            var productCategory = document.getElementById("product_category");
            var productImg = document.getElementById("product_img");

            if (productName.value == "") {
                alert("Please enter product name.");
                productName.focus();
                return false;
            }

            if (productPrice.value == "") {
                alert("Please enter product price.");
                productPrice.focus();
                return false;
            }

            if (productDesc.value == "") {
                alert("Please enter product description.");
                productDesc.focus();
                return false;
            }

            if (productCategory.value == "") {
                alert("Please enter product category.");
                productCategory.focus();
                return false;
            }

            if (productImg.files.length == 0) {
                alert("Please select a product image.");
                productImg.focus();
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return validateForm()">
        <div>
            <table style="margin-left:auto;margin-right:auto;">
                <tr>
                    <td>
                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label><br />
                        <h1>CRUD Products</h1><br />
                        Product Name : <asp:TextBox ID="product_name" runat="server" Required="true" Placeholder="Enter your First Name"></asp:TextBox><br /><br />
                        Product Price : <asp:TextBox ID="product_price" runat="server" Required="true" Placeholder="Enter your Last Name"></asp:TextBox><br /><br />
                        Product Description : <asp:TextBox ID="product_desc" runat="server" Required="true" Placeholder="Enter your Email Address"></asp:TextBox><br />
                        <br />
                        Product Category: <asp:TextBox ID="product_category" runat="server" Required="true"></asp:TextBox>
                        <br />
                        <br />
                        Product Image:
                        <input id="product_img" type="file" required /><br />
                        <asp:Button ID="sbtBtn" runat="server" Text="Submit" OnClick="sbtBtn_Click" />
                    </td>
                </tr>
            </table>
            <table style="margin-left:auto;margin-right:auto;">
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                          <Columns>
                            <asp:TemplateField HeaderText="Product Name">
                              <ItemTemplate>
                                <%# Eval("PRODUCT_NAME") %>
                              </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Product Price">
                              <ItemTemplate>
                                <%# Eval("PRODUCT_PRICE") %>
                              </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Product Description">
                              <ItemTemplate>
                                <%# Eval("PRODUCT_DESC") %>
                              </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Product Category">
                              <ItemTemplate>
                                <%# Eval("PRODUCT_CATEGORY") %>
                              </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions">
                              <ItemTemplate>
                                <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" CausesValidation="False" />
                                <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?')" CausesValidation="False" />
                              </ItemTemplate>
                            </asp:TemplateField>
                          </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
