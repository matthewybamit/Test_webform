using System;
using System.Configuration;
using System.Web.UI;
using Oracle.ManagedDataAccess.Client;

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
                else
                {
                    // Handle scenario where productId is not provided
                    // Perhaps display an error message or redirect to another page
                }
            }
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
                            // Retrieve product information
                            string productImg = reader.GetString(reader.GetOrdinal("PRODUCT_IMG"));
                            string productName = reader.GetString(reader.GetOrdinal("PRODUCT_NAME"));
                            decimal productPrice = reader.GetDecimal(reader.GetOrdinal("PRODUCT_PRICE"));
                            string productDesc = reader.GetString(reader.GetOrdinal("PRODUCT_DESC"));

                            string formattedPrice = $"₱{productPrice.ToString("#,##0.00")}";

                            lnkBookNow.NavigateUrl = $"WebForm6.aspx?productId={productId}";

                            productImage.Src = "Images/"+productImg;
                            productNameLabel.Text = productName;
                            productDescLabel.Text = productDesc;
                            productPriceLabel.Text = formattedPrice; // Assuming productPriceLabel is an ASP.NET Label controlriceText;
                        }
                        else
                        {
                            // Handle scenario where product with provided productId is not found
                            // Perhaps display an error message or redirect to another page
                        }
                    }
                }
            }
        }
    }
}