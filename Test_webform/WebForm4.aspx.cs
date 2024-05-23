using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client; // Assuming Oracle Database

namespace Test_webform
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // This ensures data is loaded only once on initial page load
            {
                LoadProducts();
            }

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
        private string GetSessionUserId()
        {
            // Retrieve user ID from session storage
            return HiddenField1.Value;
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

    

        public class CartItem
        {
            public int CartId { get; set; } // Add CartId property
            public string ProductImage { get; set; }
            public string ProductName { get; set; }
            public string Size { get; set; }
            public decimal RentRate { get; set; }
        }
        protected void toggleButton_Click(object sender, EventArgs e)
        {
            // Retrieve the user ID from the hidden field
            string userId = HiddenField1.Value;

            // Refresh the side panel to display updated cart items
            RefreshSidePanel(userId);

            // Refresh the whole page
            Response.Redirect(Request.RawUrl);
        }
        protected void ddlGender_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadProducts();
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadProducts();
        }

        private void InsertUserIDIntoDatabase(string uid)
        {
            string connString = ConfigurationManager.ConnectionStrings["OracleConString"].ConnectionString;
            string query = "INSERT INTO USER_ID (USER_ID) VALUES (:UserID)";

            using (OracleConnection con = new OracleConnection(connString))
            {
                using (OracleCommand cmd = new OracleCommand(query, con))
                {
                    OracleParameter uidParam = new OracleParameter(":UserID", OracleDbType.Varchar2);
                    uidParam.Value = uid;
                    cmd.Parameters.Add(uidParam);

                    try
                    {
                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            // Insertion successful
                        }
                        else
                        {
                            // Insertion failed
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle exception
                    }
                }
            }
        }
        private void LoadProducts()
        {
            string connString = ConfigurationManager.ConnectionStrings["OracleConString"].ConnectionString;
            string query = "SELECT * FROM PRODUCTS WHERE 1=1"; // Base query

            if (!string.IsNullOrEmpty(ddlGender.SelectedValue))
            {
                if (ddlGender.SelectedValue == "Him")
                {
                    query += " AND PRODUCT_CATEGORY = 'Formal'";
                }
                else if (ddlGender.SelectedValue == "Her")
                {
                    query += " AND PRODUCT_CATEGORY IN ('Wedding Gowns', 'Debut Gowns', 'Dresses')";
                }
            }

            if (!string.IsNullOrEmpty(ddlCategory.SelectedValue))
            {
                query += " AND PRODUCT_CATEGORY = :category";
            }

            using (OracleConnection con = new OracleConnection(connString))
            {
                con.Open();

                using (OracleCommand cmd = new OracleCommand(query, con))
                {
                    if (!string.IsNullOrEmpty(ddlCategory.SelectedValue))
                    {
                        OracleParameter categoryParam = new OracleParameter(":category", OracleDbType.Varchar2); // Assuming the category is a string
                        categoryParam.Value = ddlCategory.SelectedValue;
                        cmd.Parameters.Add(categoryParam);
                    }

                    using (OracleDataReader reader = cmd.ExecuteReader())
                    {
                        // Clear existing items (if any)
                        gridProducts.Controls.Clear();

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                
                                string productName = reader.GetString(reader.GetOrdinal("PRODUCT_NAME"));
                                decimal productPrice = reader.GetDecimal(reader.GetOrdinal("PRODUCT_PRICE"));
                                string productDesc = reader.GetString(reader.GetOrdinal("PRODUCT_DESC"));
                                string productCategory = reader.GetString(reader.GetOrdinal("PRODUCT_CATEGORY"));
                                string productImg = !reader.IsDBNull(reader.GetOrdinal("PRODUCT_IMG")) ? reader.GetString(reader.GetOrdinal("PRODUCT_IMG")) : string.Empty;
                                string formattedPrice = productPrice.ToString("#,##0.00");

                                // Create a new grid item dynamically
                                LiteralControl item = new LiteralControl();
                                decimal productId = reader.GetInt32(reader.GetOrdinal("PRODUCT_ID")); // Assuming PRODUCT_ID is an integer column
                                System.Diagnostics.Debug.WriteLine($"Product ID: {productId}");
                                item.Text = $@"
                                            <div class=""grid-item"">
                                                <a href='WebForm5.aspx?productId={productId}'><img src=""Images/{productImg}"" alt=""{productName}""></a> 
                                                <div class=""label"">{productName}</div><br>
                                                <div class=""labelprice"">₱ {formattedPrice}</div>
                                                <div class=""labeldesc"">{productDesc}</div>
                                                
                                            </div>";    


                                gridProducts.Controls.Add(item);
                            }
                        }
                        else
                        {
                            // Handle no products found scenario (optional)
                            gridProducts.Controls.Add(new LiteralControl("<p>No products found.</p>"));
                        }
                    }
                }
            }
        }
    }
}