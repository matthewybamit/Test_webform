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
        protected void ddlGender_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadProducts();
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadProducts();
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
                                                <a href='WebForm5.aspx?productId={productId}'><img src=""{productImg}"" alt=""{productName}""></a> 
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