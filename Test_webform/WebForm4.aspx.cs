using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
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
        }

        private void LoadProducts()
        {
            string connString = ConfigurationManager.ConnectionStrings["OracleConString"].ConnectionString;
            string query = "SELECT * FROM PRODUCT"; // Adjust query if needed (e.g., filter by category)

            using (OracleConnection con = new OracleConnection(connString))
            {
                con.Open();

                using (OracleCommand cmd = new OracleCommand(query, con))
                {
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


                                // Create a new grid item dynamically
                                LiteralControl item = new LiteralControl();
                                item.Text = $@"
                                    <div class=""grid-item"">
                                        <img src=""{productImg}"" alt=""{productName}"">
                                        <div class=""label"">{productName}</div><br>
                                        <div class=""label"">₱{productPrice}</div>
                                        <div class=""label"">{productDesc}</div>  <div class=""label"">{productCategory}</div>  </div>";

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