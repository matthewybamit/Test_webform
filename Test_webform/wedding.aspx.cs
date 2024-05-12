using System;
using System.Configuration;
using System.Data;
using Oracle.ManagedDataAccess.Client;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace Test_webform
{
    public partial class weddingaspx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridContainer();
            }
        }

        protected void PopulateGridContainer()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["OracleConString"].ConnectionString;

            using (OracleConnection con = new OracleConnection(connectionString))
            {
                // Update the SQL query to fetch products only from the "dress" category
                string query = "SELECT PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_IMG FROM PRODUCTS WHERE PRODUCT_CATEGORY = 'wedding'";

                using (OracleCommand cmd = new OracleCommand(query, con))
                using (OracleDataAdapter adapter = new OracleDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();

                    con.Open();
                    adapter.Fill(ds);
                    con.Close();

                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        string productName = row["PRODUCT_NAME"].ToString();
                        string productPrice = "₱" + Convert.ToDouble(row["PRODUCT_PRICE"]).ToString("N2");
                        string productImage = row["PRODUCT_IMG"].ToString();

                        HtmlGenericControl gridItem = new HtmlGenericControl("div");
                        gridItem.Attributes["class"] = "grid-item";

                        // Create an anchor tag and set its href attribute to payment.aspx
                        HtmlGenericControl anchorTag = new HtmlGenericControl("a");
                        anchorTag.Attributes["href"] = "payment.aspx";

                        // Create an image tag and set its src and alt attributes
                        HtmlGenericControl image = new HtmlGenericControl("img");
                        image.Attributes["src"] = productImage;
                        image.Attributes["alt"] = productName;

                        // Add the image tag to the anchor tag
                        anchorTag.Controls.Add(image);

                        HtmlGenericControl nameLabel = new HtmlGenericControl("div");
                        nameLabel.Attributes["class"] = "label";
                        nameLabel.InnerText = productName;

                        HtmlGenericControl priceLabel = new HtmlGenericControl("div");
                        priceLabel.Attributes["class"] = "label";
                        priceLabel.InnerText = productPrice;

                        // Add name and price labels to the grid item
                        gridItem.Controls.Add(anchorTag);
                        gridItem.Controls.Add(nameLabel);
                        gridItem.Controls.Add(new LiteralControl("<br><br><br>")); // Line breaks
                        gridItem.Controls.Add(priceLabel);

                        // Add the grid item to the grid container
                        gridContainer.Controls.Add(gridItem);
                    }
                }
            }
        }
    }
}
