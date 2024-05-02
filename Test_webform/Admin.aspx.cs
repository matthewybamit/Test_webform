using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Test_webform
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["OracleConString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                con.Open();
                OracleDataAdapter mySQLAdp = new OracleDataAdapter("SELECT * FROM PRODUCT", con);
                DataTable dt = new DataTable();
                mySQLAdp.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                con.Close();
            }
        }

        protected void sbtBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                con.Open();
                string query = "INSERT INTO PRODUCT (PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_DESC, PRODUCT_CATEGORY, PRODUCT_IMG) VALUES (:ProductName, :ProductPrice, :ProductDesc, :ProductCategory, :ProductImg)";
                OracleCommand cmd = new OracleCommand(query, con);

                OracleParameter productName = new OracleParameter(":ProductName", OracleDbType.Varchar2);
                productName.Value = product_name.Text;

                OracleParameter productPrice = new OracleParameter(":ProductPrice", OracleDbType.Decimal);
                productPrice.Value = Convert.ToDecimal(product_price.Text);

                OracleParameter productDesc = new OracleParameter(":ProductDesc", OracleDbType.Varchar2);
                productDesc.Value = product_desc.Text;

                OracleParameter productCategory = new OracleParameter(":ProductCategory", OracleDbType.Varchar2);
                productCategory.Value = product_category.Text;

                OracleParameter productImg = new OracleParameter(":ProductImg", OracleDbType.Varchar2);

                if (Request.Files.Count > 0 && Request.Files["product_img"] != null && Request.Files["product_img"].ContentLength > 0)
                {
                    string fileName = Path.GetFileName(Request.Files["product_img"].FileName);
                    productImg.Value = fileName;

                    // Save the uploaded image to a specific folder (optional)
                    string filePath = Path.Combine(Server.MapPath("~/ProductImages/"), fileName);
                    Request.Files["product_img"].SaveAs(filePath);
                }
                else
                {
                    productImg.Value = "dresses.png"; // Or provide a default value
                }

                cmd.Parameters.Add(productName);
                cmd.Parameters.Add(productPrice);
                cmd.Parameters.Add(productDesc);
                cmd.Parameters.Add(productCategory);
                cmd.Parameters.Add(productImg);

                cmd.ExecuteNonQuery();
                con.Close();

                // Reload the GridView
                con.Open();
                OracleDataAdapter mySQLAdp = new OracleDataAdapter("SELECT * FROM PRODUCT", con);
                DataTable dt = new DataTable();
                mySQLAdp.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                con.Close();

                // Clear the form
                product_name.Text = "";
                product_price.Text = "";
                product_desc.Text = "";
                product_category.Text = "";

                lblMsg.Text = "Data inserted Successfully.";
                lblMsg.ForeColor = System.Drawing.Color.Green;
            }
        }
        private void BindGridView()
        {
            con.Open();
            OracleDataAdapter mySQLAdp = new OracleDataAdapter("SELECT * FROM PRODUCT", con);
            DataTable dt = new DataTable();
            mySQLAdp.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Update")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];

                // Get the product ID from a hidden field
                HiddenField hiddenProductID = (HiddenField)row.FindControl("hiddenProductID");
                int productID = Convert.ToInt32(hiddenProductID.Value);

                // Get other values from the controls you added in the template (assuming they have IDs)
                TextBox txtProductName = (TextBox)row.FindControl("txtProductName");
                TextBox txtProductPrice = (TextBox)row.FindControl("txtProductPrice");
                TextBox txtProductDesc = (TextBox)row.FindControl("txtProductDesc");
                TextBox txtProductCategory = (TextBox)row.FindControl("txtProductCategory");

                string productName = txtProductName.Text;
                decimal productPrice = Convert.ToDecimal(txtProductPrice.Text);
                string productDesc = txtProductDesc.Text;
                string productCategory = txtProductCategory.Text;

                // Update the product in the database
                UpdateProduct(productID, productName, productPrice, productDesc, productCategory);

                // Reload the GridView
                BindGridView();
            }
            else if (e.CommandName == "Delete")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];

                // Get the product ID from a hidden field
                HiddenField hiddenProductID = (HiddenField)row.FindControl("hiddenProductID");
                int productID = Convert.ToInt32(hiddenProductID.Value);

                // Delete the product from the database
                DeleteProduct(productID);

                // Reload the GridView
                BindGridView();
            }
        }


        private void UpdateProduct(int productID, string productName, decimal productPrice, string productDesc, string productCategory)
        {
            con.Open();
            string query = "UPDATE PRODUCT SET PRODUCT_NAME = :ProductName, PRODUCT_PRICE = :ProductPrice, PRODUCT_DESC = :ProductDesc, PRODUCT_CATEGORY = :ProductCategory WHERE PRODUCT_ID = :ProductID";
            OracleCommand cmd = new OracleCommand(query, con);

            OracleParameter productParamName = new OracleParameter(":ProductName", OracleDbType.Varchar2);
            productParamName.Value = productName;
            cmd.Parameters.Add(productParamName);

            OracleParameter productParamPrice = new OracleParameter(":ProductPrice", OracleDbType.Decimal);
            productParamPrice.Value = productPrice;
            cmd.Parameters.Add(productParamPrice);

            OracleParameter productParamDesc = new OracleParameter(":ProductDesc", OracleDbType.Varchar2);
            productParamDesc.Value = productDesc;
            cmd.Parameters.Add(productParamDesc);

            OracleParameter productParamCategory = new OracleParameter(":ProductCategory", OracleDbType.Varchar2);
            productParamCategory.Value = productCategory;
            cmd.Parameters.Add(productParamCategory);

            OracleParameter productParamID = new OracleParameter(":ProductID", OracleDbType.Int32);
            productParamID.Value = productID;
            cmd.Parameters.Add(productParamID);

            cmd.ExecuteNonQuery();
            con.Close();

            lblMsg.Text = "Product updated successfully!";
            lblMsg.ForeColor = System.Drawing.Color.Green;
        }

        private void DeleteProduct(int productID)
        {
            con.Open();
            string query = "DELETE FROM PRODUCT WHERE PRODUCT_ID = :ProductID";
            OracleCommand cmd = new OracleCommand(query, con);

            OracleParameter productParamID = new OracleParameter(":ProductID", OracleDbType.Int32);
            productParamID.Value = productID;
            cmd.Parameters.Add(productParamID);

            cmd.ExecuteNonQuery();
            con.Close();

            lblMsg.Text = "Product deleted successfully!";
            lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            }
}