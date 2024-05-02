using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Oracle.ManagedDataAccess.Client;

public partial class product_info : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Check if the productId query parameter is present
            if (Request.QueryString["productId"] != null)
            {
                // Retrieve the productId from the query parameters
                int productId;
                if (int.TryParse(Request.QueryString["productId"], out productId))
                {
                    // Use productId to fetch product information from the database
                    LoadProductDetails(productId);
                }
                else
                {
                    // Handle invalid productId
                    Response.Redirect("error_page.aspx"); // Redirect to an error page
                }
            }
            else
            {
                // Handle missing productId query parameter
                Response.Redirect("error_page.aspx"); // Redirect to an error page
            }
        }
    }

    private void LoadProductDetails(int productId)
    {
        string connString = ConfigurationManager.ConnectionStrings["OracleConString"].ConnectionString;
        string query = "SELECT * FROM Products WHERE PRODUCT_ID = :ProductId";

        using (OracleConnection connection = new OracleConnection(connString))
        {
            using (OracleCommand command = new OracleCommand(query, connection))
            {
                // Add parameter for productId
                command.Parameters.Add(":ProductId", OracleDbType.Int32).Value = productId;

                try
                {
                    connection.Open();
                    OracleDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        // Retrieve product details from the reader
                        string productName = reader["PRODUCT_NAME"].ToString();
                        string productPrice = reader["PRODUCT_PRICE"].ToString();
                        string productDesc = reader["PRODUCT_DESCRIPTION"].ToString();
                        string productImage = reader["PRODUCT_IMG"].ToString();

                        // Populate UI elements with product details
                        ClientScript.RegisterStartupScript(this.GetType(), "UpdateProductDetails",
                          $"document.getElementById('productName').innerText = '{productName}';" +
                          $"document.getElementById('productPrice').innerText = '₱{productPrice}';" +
                          $"document.getElementById('productDesc').innerText = '{productDesc}';" +
                          $"document.getElementById('productImage').src = '{productImage}';", // Set the src attribute of the image tag
                          true);
                    }
                    else
                    {
                        // Handle case where productId does not exist in the database
                        Response.Redirect("error_page.aspx"); // Redirect to an error page
                    }
                }
                catch (Exception ex)
                {
                    // Handle exceptions
                    Response.Redirect("error_page.aspx"); // Redirect to an error page
                }
            }
        }
    }
}
