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


namespace Test_webform
{
    public partial class Test_webform : System.Web.UI.Page
    {


        protected void Load_Page(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Insert data into Oracle database when the page loads
                //InsertDataOracle();
            }

            
        }

        private void InsertDataOracle()
        {
            try
            {
                // Retrieve data from cookies
                string username = Request.Cookies["username"]?.Value;
                //string name = Request.Cookies["name"]?.Value;
                string profilePicture = Request.Cookies["profilePicture"]?.Value;
                string email = Request.Cookies["email"]?.Value;
                string uid = Request.Cookies["uid"]?.Value;

                // Check if any of the cookie values are null
                if (username != null && profilePicture != null && email != null && uid != null)
                {
                    // Connection string for Oracle database

                    string connectionString = ConfigurationManager.ConnectionStrings["Accounts"].ConnectionString;

                    // SQL SELECT statement to check for existing record
                    string selectSql = "SELECT COUNT(*) FROM GOOGLE_ACC WHERE ID = :uid AND USERNAME = :username";

                    // SQL INSERT statement
                    string insertSql = "INSERT INTO GOOGLE_ACC (ID, USERNAME, EMAIL, PROFILE_PIC) VALUES (:uid, :username, :email, :profilePicture)";

                    // Create OracleConnection object
                    using (OracleConnection connection = new OracleConnection(connectionString))
                    {
                        // Create OracleCommand object to check for existing record
                        using (OracleCommand selectCommand = new OracleCommand(selectSql, connection))
                        {
                            // Bind parameters for SELECT statement
                            selectCommand.Parameters.Add("ID", OracleDbType.Varchar2).Value = uid;
                            selectCommand.Parameters.Add("USERNAME", OracleDbType.Varchar2).Value = username;

                            // Open database connection
                            connection.Open();

                            // Execute SELECT statement to check for existing record
                            int existingCount = Convert.ToInt32(selectCommand.ExecuteScalar());

                            // Check if record already exists
                            if (existingCount == 0)
                            {
                                // Create OracleCommand object for INSERT statement
                                using (OracleCommand insertCommand = new OracleCommand(insertSql, connection))
                                {
                                    // Bind parameters for INSERT statement
                                    insertCommand.Parameters.Add("uid", OracleDbType.Varchar2).Value = uid;
                                    insertCommand.Parameters.Add("username", OracleDbType.Varchar2).Value = username;
                                    insertCommand.Parameters.Add("email", OracleDbType.Varchar2).Value = email;
                                    insertCommand.Parameters.Add("profilePicture", OracleDbType.Varchar2).Value = profilePicture;

                                    // Execute INSERT statement
                                    int rowsAffected = insertCommand.ExecuteNonQuery();

                                    // Display success message
                                    Response.Write("Data inserted successfully. Rows affected: " + rowsAffected);
                                }
                            }
                            else
                            {
                                // Display message if record already exists
                                Response.Write("Record with the same ID and Username already exists. Skipping insertion.");
                            }
                        }
                    }
                }
                else
                {
                    Response.Write("One or more cookie values are null.");
                }
            }
            catch (OracleException ex)
            {
                // Handle the exception, log the error, or display a user-friendly message
                Response.Write("An error occurred while connecting to the Oracle database: " + ex.Message);
            }
        }


        protected void Insert(object sender, EventArgs e)
        {

        }
    }
}