using System;
using System.Collections.Generic;
using System.Configuration;
using System.Text;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;
using static Test_webform.WebForm4;

namespace Test_webform
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve productId from query parameters
                if (Request.QueryString["productId"] != null)
                {
                    int productId = Convert.ToInt32(Request.QueryString["productId"]);
                    DisplayProductDetails(productId);
                }
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

        protected void toggleButton_Click(object sender, EventArgs e)
        {
            // Retrieve the user ID from the hidden field
            string userId = HiddenField1.Value;

            // Refresh the side panel to display updated cart items
            RefreshSidePanel(userId);

            // Refresh the whole page
            Response.Redirect(Request.RawUrl);
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
                htmlBuilder.Append($"<button class='remove-item-btn' data-cartid='{item.CartId}'>Remove</button>");
                htmlBuilder.Append($"</div>");
                htmlBuilder.Append($"</div>");
            }

            // Add Cash-out button HTML
            htmlBuilder.Append("<div>");
            htmlBuilder.Append("<button id='cashOutButton' class='cash-out-btn'>Cash-out</button>");
            htmlBuilder.Append("</div>");

            // Update the content of the side panel
            sidePanel.InnerHtml = htmlBuilder.ToString();

            // Register JavaScript function to handle remove button click
            Page.ClientScript.RegisterStartupScript(this.GetType(), "RemoveButtonClickScript", @"
<script>
    $(document).ready(function(){
        $('.remove-item-btn').click(function(){
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
            // Ask for confirmation before redirecting
            var confirmCashout = confirm('Are you sure you want to proceed with cashing out?');
            if(confirmCashout){
                window.location.href = 'cashout.aspx'; // Redirect to cashout.aspx
            }
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



        protected void addToCartButton_Click(object sender, EventArgs e)
        {
            int productId = Convert.ToInt32(Request.QueryString["productId"]);
            string sizes = sizeDropdown.Value;
            string userId = HiddenField1.Value;
            DateTime startRent = startCalendar.SelectedDate;
            DateTime endRent = returnCalendar.SelectedDate;
            decimal rentRate;

            if (decimal.TryParse(rateTextBox.Text.Replace("₱", ""), out rentRate))
            {
                // Rent rate parsed successfully
                string productName = productNameLabel.Text;
                string productDesc = productDescLabel.Text;
                string productPrice = productPriceLabel.Text;
                string productImg = productImage.Src;


                // Add the item to the cart
                string connString = ConfigurationManager.ConnectionStrings["OracleConString"].ConnectionString;
                string query = "INSERT INTO CARTS (PRODUCT_ID, SIZES, USER_ID, START_RENT, END_RENT, RENT_RATE, PRODUCT_NAME, PRODUCT_DESC, PRODUCT_PRICE, PRODUCT_IMG) " +
                               "VALUES (:productId, :sizes, :userId, :startRent, :endRent, :rentRate, :productName, :productDesc, :productPrice, :productImg)";

                using (OracleConnection con = new OracleConnection(connString))
                {
                    using (OracleCommand cmd = new OracleCommand(query, con))
                    {
                        cmd.Parameters.Add(new OracleParameter("productId", productId));
                        cmd.Parameters.Add(new OracleParameter("sizes", sizes));
                        cmd.Parameters.Add(new OracleParameter("userId", userId));
                        cmd.Parameters.Add(new OracleParameter("startRent", startRent));
                        cmd.Parameters.Add(new OracleParameter("endRent", endRent));
                        cmd.Parameters.Add(new OracleParameter("rentRate", rentRate));
                        cmd.Parameters.Add(new OracleParameter("productName", productName));
                        cmd.Parameters.Add(new OracleParameter("productDesc", productDesc));
                        cmd.Parameters.Add(new OracleParameter("productPrice", productPrice));
                        cmd.Parameters.Add(new OracleParameter("productImg", productImg));

                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            Response.Redirect(Request.Url.AbsoluteUri);
                            // Refresh the side panel to display the updated cart
                            RefreshSidePanel(userId);

                        }
                        else
                        {
                            Response.Write("<script>alert('Failed to add item to cart. Please try again later.');</script>");
                        }
                    }
                }
            }
            else
            {
                // Handle the case where rent rate is not a valid decimal
                Response.Write("<script>alert('Invalid rent rate. Please enter a valid value.');</script>");
            }
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

        protected void Calendar_SelectionChanged(object sender, EventArgs e)
        {
            if (startCalendar.SelectedDate != DateTime.MinValue && returnCalendar.SelectedDate != DateTime.MinValue)
            {
                int productId = Convert.ToInt32(Request.QueryString["productId"]);
                decimal rentRate = CalculateRentRate(productId, startCalendar.SelectedDate, returnCalendar.SelectedDate);
                rateTextBox.Text = $"₱{rentRate.ToString("#,##0.00")}";
            }
        }

        protected void CalculateRentRate(object sender, EventArgs e)
        {
            // Ensure both dates are selected
            if (startCalendar.SelectedDate != DateTime.MinValue && returnCalendar.SelectedDate != DateTime.MinValue)
            {
                DateTime startRent = startCalendar.SelectedDate;
                DateTime endRent = returnCalendar.SelectedDate;

                // Retrieve product price from the label or database
                string productPriceText = productPriceLabel.Text.Trim('₱');
                decimal productPrice;

                if (decimal.TryParse(productPriceText, out productPrice))
                {
                    decimal rentRate = CalculateRentRate(productPrice, startRent, endRent);
                    rateTextBox.Text = $"₱{rentRate.ToString("#,##0.00")}";
                }
                else
                {
                    // Handle the case where productPriceText is not a valid decimal
                    rateTextBox.Text = "Invalid Price";
                }
            }
        }


        private decimal CalculateRentRate(decimal productPrice, DateTime startRent, DateTime endRent)
        {
            // Assuming the rent rate is a fixed percentage of the product price per day
            decimal dailyRate = productPrice * 15m; // Example: 10% of the product price per day
            int rentalDays = (endRent - startRent).Days;
            if (rentalDays <= 0) rentalDays = 1; // Ensure at least one day of rent

            return dailyRate * rentalDays;
        }

        public class CartItem
        {
            public int CartId { get; set; } // Add CartId property
            public string ProductImage { get; set; }
            public string ProductName { get; set; }
            public string Size { get; set; }
            public decimal RentRate { get; set; }
        }
        private void DisplayProductDetails(int productId)
        {
            string connString = ConfigurationManager.ConnectionStrings["OracleConString"].ConnectionString;
            string query = "SELECT PRODUCT_IMG, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_DESC FROM PRODUCTS WHERE PRODUCT_ID = :productId";

            using (OracleConnection con = new OracleConnection(connString))
            {
                using (OracleCommand cmd = new OracleCommand(query, con))
                {
                    cmd.Parameters.Add(new OracleParameter("productId", productId));
                    con.Open();

                    using (OracleDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string productImg = reader.GetString(reader.GetOrdinal("PRODUCT_IMG"));
                            string productName = reader.GetString(reader.GetOrdinal("PRODUCT_NAME"));
                            decimal productPrice = reader.GetDecimal(reader.GetOrdinal("PRODUCT_PRICE"));
                            string productDesc = reader.GetString(reader.GetOrdinal("PRODUCT_DESC"));

                            string formattedPrice = $"₱{productPrice.ToString("#,##0.00")}";

                            lnkBookNow.NavigateUrl = $"WebForm6.aspx?productId={productId}";

                            productImage.Src = "Images/" + productImg;
                            productNameLabel.Text = productName;
                            productDescLabel.Text = productDesc;
                            productPriceLabel.Text = formattedPrice;
                        }
                    }
                }
            }
        }
    }
}


