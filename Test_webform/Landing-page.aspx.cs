using System;
using System.Threading;
using System.Web.UI;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Auth.OAuth2.Flows;
using Google.Apis.Auth.OAuth2.Web;
using Google.Apis.Services;
using Google.Apis.Oauth2.v2;
//using ASPSnippets.GoogleAPI;
using ASPSnippets.FaceBookAPI;
using System.Web.Script.Serialization;
using Google.Apis.Oauth2.v2.Data;
using System.Web;
using Microsoft.Ajax.Utilities;
using static Test_webform.WebForm1;
using System.Web.Security;
using System.Data;
using Oracle.ManagedDataAccess.Client;
using System.Configuration;
using System.Collections.Generic;
using System.Text;
using System.Web.Services;


namespace Test_webform
{
    public partial class Test_webform : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
           
            

            // Retrieve user ID from session storage
            string sessionUserId = GetSessionUserId();

            // Check if the sessionUserId is empty
            if (string.IsNullOrEmpty(sessionUserId))
            {
                // Retrieve the user ID from the database
                sessionUserId = GetDatabaseUserId();
            }

            // Refresh the side panel to display cart items
            RefreshSidePanel(sessionUserId);
        }
      
        private string GetDatabaseUserId(string sessionUserId)
        {
            string connString = ConfigurationManager.ConnectionStrings["OracleConString"].ConnectionString;
            string query = "SELECT USER_ID FROM CARTS WHERE USER_ID = :sessionUserId";

            string databaseUserId = string.Empty;

            using (OracleConnection con = new OracleConnection(connString))
            {
                using (OracleCommand cmd = new OracleCommand(query, con))
                {
                    cmd.Parameters.Add(new OracleParameter("sessionUserId", sessionUserId));
                    con.Open();

                    using (OracleDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            databaseUserId = reader.GetString(reader.GetOrdinal("USER_ID"));
                        }
                    }
                }
            }

            return databaseUserId;
        }

        private string GetSessionUserId()
        {
            // Retrieve user ID from session storage
            return HiddenField1.Value;
        }

        private void RefreshSidePanel(string userId)
        {
            // Retrieve cart items associated with the user's session ID from the database
            List<CartItem> cartItems = GetCartItems(userId); // Implement this method to retrieve cart items

            // Generate HTML content for displaying cart items in the side panel
            StringBuilder htmlBuilder = new StringBuilder();
            foreach (CartItem item in cartItems)
            {
                htmlBuilder.Append("<div class='cart-item'>");
                htmlBuilder.Append($"<img src='{item.ProductImage}' alt='{item.ProductName}' class='cart-item-image' />");
                htmlBuilder.Append($"<div class='cart-item-details'>");
                htmlBuilder.Append($"<p>{item.ProductName}</p>");
                htmlBuilder.Append($"<p>Size: {item.Size}</p>");
                htmlBuilder.Append($"<p>Rent Rate: ₱{item.RentRate.ToString("#,##0.00")}</p>");
                // Add data attribute for CARTID
                htmlBuilder.Append($"<div class='cart-actions'>");
                htmlBuilder.Append($"<button class='remove-item-btn' data-cartid='{item.CartId}'>Remove</button>");
                htmlBuilder.Append("</div>");
                htmlBuilder.Append($"</div>");
                htmlBuilder.Append($"</div>");
            }

            // Add Cash-out button HTML
            htmlBuilder.Append("<div class='cart-actions'>");
            htmlBuilder.Append("<asp:LinkButton ID='cashOutButton' runat='server' OnClick='CashOutButton_Click'>Cash-out</asp:LinkButton>");
            htmlBuilder.Append("</div>");

            // Update the content of the side panel
            sidePanel.InnerHtml = htmlBuilder.ToString();

            // Set CSS class for the cashOutButton LinkButton
            string script = @"
<script>
    document.getElementById('cashOutButton').classList.add('cart-btn');
</script>";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CashOutButtonCssScript", script);

            Page.ClientScript.RegisterStartupScript(this.GetType(), "RemoveButtonClickScript", @"
<script>
    $(document).ready(function(){
        console.log('Document is ready');

        $('.remove-item-btn').click(function(){
            console.log('Remove button clicked');
            var userId = '" + userId + @"';
            var cartId = $(this).data('cartid');
            $.ajax({
                type: 'POST',
                url: 'WebForm5.aspx/RemoveItemFromCart',
                data: JSON.stringify({ userId: userId, cartId: cartId }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function(response){
                    if(response.d){
                        alert('Item removed successfully.');
                        location.reload(); // Refresh the page after removing the item
                    } else {
                        alert('Failed to remove item from cart.');
                    }
                },
                error: function(){
                    alert('Error occurred while processing your request.');
                }
            });
        });

        // Handle Cash-out button click
        $('#cashOutButton').click(function(){
            console.log('Cash-out button clicked');
            // Redirect directly to cashout.aspx
            window.location.href = 'cashout.aspx';
        });
    });
</script>");
        }


        [WebMethod]
        public static bool RemoveItemFromCart(string userId, int cartId)
        {
            // Implement logic to remove the item from the cart based on userId and cartId
            // Example: Call a method to delete the item from the database
            bool itemRemoved = DeleteItemFromCart(userId, cartId); // Implement this method

            return itemRemoved;
        }
        private static bool DeleteItemFromCart(string userId, int cartId)
        {
            string connString = ConfigurationManager.ConnectionStrings["OracleConString"].ConnectionString;
            string query = "DELETE FROM CARTS WHERE USER_ID = :userId AND CARTID = :cartId";

            using (OracleConnection con = new OracleConnection(connString))
            {
                using (OracleCommand cmd = new OracleCommand(query, con))
                {
                    cmd.Parameters.Add(new OracleParameter("userId", userId));
                    cmd.Parameters.Add(new OracleParameter("cartId", cartId));

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();

                    return rowsAffected > 0;
                }
            }
        }

        [WebMethod]

        private List<CartItem> GetCartItems(string userId)
        {
            List<CartItem> cartItems = new List<CartItem>();

            string connString = ConfigurationManager.ConnectionStrings["OracleConString"].ConnectionString;
            string query = "SELECT CARTID, PRODUCT_IMG, PRODUCT_NAME, RENT_RATE, PRODUCT_DESC, SIZES " +
                           "FROM CARTS " +
                           "WHERE USER_ID = :userId";

            using (OracleConnection con = new OracleConnection(connString))
            {
                using (OracleCommand cmd = new OracleCommand(query, con))
                {
                    cmd.Parameters.Add(new OracleParameter("userId", userId));
                    con.Open();

                    using (OracleDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            int cartId = reader.GetInt32(reader.GetOrdinal("CARTID")); // Retrieve CartId
                            string productImg = reader.GetString(reader.GetOrdinal("PRODUCT_IMG"));
                            string productName = reader.GetString(reader.GetOrdinal("PRODUCT_NAME"));
                            string productDesc = reader.GetString(reader.GetOrdinal("PRODUCT_DESC"));
                            string size = reader.GetString(reader.GetOrdinal("SIZES"));

                            // Retrieve rent rate as decimal directly from the database
                            decimal rentRate = reader.GetDecimal(reader.GetOrdinal("RENT_RATE"));

                            // Create a CartItem object and add it to the list
                            cartItems.Add(new CartItem { CartId = cartId, ProductImage = productImg, ProductName = productName, RentRate = rentRate, Size = size });
                        }
                    }
                }
            }

            return cartItems;
        }

        private string GetDatabaseUserId()
        {
            // Retrieve the user ID from the database
            string connString = ConfigurationManager.ConnectionStrings["OracleConString"].ConnectionString;
            string query = "SELECT USER_ID FROM CARTS"; // Adjust your query as needed

            string databaseUserId = string.Empty;

            using (OracleConnection con = new OracleConnection(connString))
            {
                using (OracleCommand cmd = new OracleCommand(query, con))
                {
                    con.Open();

                    using (OracleDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            databaseUserId = reader.GetString(reader.GetOrdinal("USER_ID"));
                        }
                    }
                }
            }

            return databaseUserId;
        }
        public class CartItem
        {
            public int CartId { get; set; } // Add CartId property
            public string ProductImage { get; set; }
            public string ProductName { get; set; }
            public string Size { get; set; }
            public decimal RentRate { get; set; }
        }
    }
}