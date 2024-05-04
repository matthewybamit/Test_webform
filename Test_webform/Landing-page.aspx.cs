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
using System.Linq;
using System.Collections.Generic;
using System.IO;
using System.Security.Cryptography;
using ASPSnippets.GoogleAPI;
using System.Xml.Linq;
using System.EnterpriseServices;
using static Test_webform.Test_webform.GoogleProfile3;


namespace Test_webform
{
    public partial class Test_webform : System.Web.UI.Page
    {


        protected void Load_Page(object sender, EventArgs e)
        {   
            GoogleConnect.ClientId = "35298655443-6geak9840cbrbia04o2gihnbouragbq1.apps.googleusercontent.com";
            GoogleConnect.ClientSecret = "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";
            GoogleConnect.RedirectUri = Request.Url.AbsoluteUri.Split('?')[0];

       

            if (!this.IsPostBack)
            {
                string code = Request.QueryString["code"];
                if (!string.IsNullOrEmpty(code))
                {
                    GoogleConnect connect = new GoogleConnect();
                    string json = connect.Fetch("me", code);
                    GoogleProfile3 profile = new JavaScriptSerializer().Deserialize<GoogleProfile3>(json);


                    profile.InsertIntoDatabase();
                    //RetrieveDb(profile);
                    
                    //lblId.Text = profile.Id;
                    //lblName.Text = profile.Name;
                    //lblEmail.Text = profile.Email;
                    //ProfileImage.ImageUrl = profile.Picture;
                    //lblName.Text = profile.Name;

                    //pnlProfile.Visible = true;
                }
                if (Request.QueryString["error"] == "access_denied")
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Access denied.')", true);
                }
                // This page will handle the AJAX request to insert data into Oracle database
                //string uid = Request.Form["uid"];
                //string username = Request.Form["username"];
                //string email = Request.Form["email"];
                //string profilePicture = Request.Form["profilePicture"];

                // Call method to insert data into Oracle database
                //InsertData(uid, username, email, profilePicture);
           
        /*if (Request.Url.AbsolutePath.Equals("/Landing-page.aspx", StringComparison.InvariantCultureIgnoreCase))
        {
            // Fetch cookie details from XHR request
            var json = new StreamReader(Request.InputStream).ReadToEnd();
            var cookies = new JavaScriptSerializer().Deserialize<Dictionary<string, string>>(json);

            // Extract necessary information from cookies
            string uid = cookies["uid"];
            string username = cookies["username"];
            string email = cookies["email"];
            string profilePicture = cookies["profilePicture"];
            // Extract other cookie values as needed

            // Insert data into Oracle database
            InsertDataOracle(uid, username, email, profilePicture);
        }
        else
        {
            // Your landing page logic goes here
        }*/

    }
            }

        public void RetrieveDb2(GoogleProfile3 profile)
        {
            

            // Retrieve the connection string from configuration
            string connectionString = ConfigurationManager.ConnectionStrings["OracleConString"].ConnectionString;

            // SQL query to retrieve user data
            string query = "SELECT U_ID, USERNAME, EMAIL, PROFILE_PIC FROM ACCOUNTS WHERE U_ID = :p_uid";

            // Create connection object
            using (OracleConnection connection = new OracleConnection(connectionString))
            {
                // Create command object
                using (OracleCommand command = new OracleCommand(query, connection))
                {


                    // Set parameter for the query
                    command.Parameters.Add("p_uid", OracleDbType.Varchar2).Value = profile.Id.ToString();

                    // Open connection
                    connection.Open();

                    // Execute the query and retrieve data
                    using (OracleDataReader reader = command.ExecuteReader())
                    {
                        // Check if there is data to read
                        if (reader.Read())
                        {
                            // Populate ASP.NET controls with retrieved user data
                            lbluid.Text = reader["U_ID"].ToString();
                            lblusername.Text = reader["USERNAME"].ToString();
                            txtEmail.Text = reader["EMAIL"].ToString();
                            // Assuming the profile picture is stored as a URL
                            profilePic.ImageUrl = reader["PROFILE_PIC"].ToString();
                        }
                        else
                        {
                            // Handle the case where no data is retrieved (e.g., display a message or set default values)
                            // For example:
                            lbluid.Text = "User not found";
                            lblusername.Text = string.Empty;
                            txtEmail.Text = string.Empty;
                            profilePic.ImageUrl = string.Empty;
                        }
                    }
                }
            }
        }

        public class GoogleProfile3
        {
            public string Id { get; set; }
            public string Name { get; set; }
            public string Email { get; set; }
            public string Picture { get; set; }

            // Method to insert the profile data into the database
            public void InsertIntoDatabase()
            {
                // Retrieve the connection string from configuration
                string connectionString = ConfigurationManager.ConnectionStrings["OracleConString"].ConnectionString;

                // SQL query to check if the uid already exists
                string checkQuery = "SELECT COUNT(*) FROM ACCOUNTS WHERE U_ID = :p_uid";

                // SQL query to insert data into the Accounts table
                string insertQuery = "INSERT INTO ACCOUNTS (U_ID, USERNAME, EMAIL, PROFILE_PIC) VALUES (:p_uid, :p_username, :p_email, :p_profile_pic)";

                // Create connection object
                using (OracleConnection connection = new OracleConnection(connectionString))
                {
                    // Check if the uid already exists
                    using (OracleCommand checkCommand = new OracleCommand(checkQuery, connection))
                    {
                        checkCommand.Parameters.Add("p_uid", OracleDbType.Varchar2).Value = Id;

                        connection.Open();
                        int count = Convert.ToInt32(checkCommand.ExecuteScalar());

                        // If the uid already exists, do not insert
                        if (count > 0)
                        {
                            Console.WriteLine("User with UID " + Id + " already exists. Not inserting duplicate data.");
                            return; // Exit the method
                        }
                    }

                    // If uid does not exist, insert the data
                    using (OracleCommand command = new OracleCommand(insertQuery, connection))
                    {
                        // Set parameters for insertion
                        command.Parameters.Add("p_uid", OracleDbType.Varchar2).Value = Id;
                        command.Parameters.Add("p_username", OracleDbType.Varchar2).Value = Name;
                        command.Parameters.Add("p_email", OracleDbType.Varchar2).Value = Email;
                        command.Parameters.Add("p_profile_pic", OracleDbType.Varchar2).Value = Picture;

                        // Execute insertion command
                        command.ExecuteNonQuery();
                    }
                }
            }
            public UserAccount RetrieveDb()
            {
                UserAccount userAccount = new UserAccount();

                // Retrieve the connection string from configuration
                string connectionString = ConfigurationManager.ConnectionStrings["OracleConString"].ConnectionString;

                // SQL query to retrieve user data
                string query = "SELECT U_ID, USERNAME, EMAIL, PROFILE_PIC FROM ACCOUNTS WHERE U_ID = :p_uid";

                // Create connection object
                using (OracleConnection connection = new OracleConnection(connectionString))
                {
                    // Create command object
                    using (OracleCommand command = new OracleCommand(query, connection))
                    {
                        // Set parameter for the query
                        command.Parameters.Add("p_uid", OracleDbType.Varchar2).Value = Id;

                        // Open connection
                        connection.Open();

                        // Execute the query and retrieve data
                        using (OracleDataReader reader = command.ExecuteReader())
                        {
                            // Check if there is data to read
                            if (reader.Read())
                            {
                                // Populate user account object with retrieved user data
                                userAccount.UID = reader["U_ID"].ToString();
                                userAccount.Username = reader["USERNAME"].ToString();
                                userAccount.Email = reader["EMAIL"].ToString();
                                userAccount.ProfilePicUrl = reader["PROFILE_PIC"].ToString();
                            }
                        }
                    }
                }

                return userAccount;
            }
        

            public class UserAccount
            {
                public string UID { get; set; }
                public string Username { get; set; }
                public string Email { get; set; }
                public string ProfilePicUrl { get; set; }
            }
        

    }


            

            private void InsertDataOracle(string uid, string username, string email, string profilePicture)
        {
           
                // Retrieve data from cookies
                //string username = Request.Cookies["username"]?.Value;
                //string name = Request.Cookies["name"]?.Value;
                //string profilePicture = Request.Cookies["profilePicture"]?.Value;
                //string email = Request.Cookies["email"]?.Value;
                //string uid = Request.Cookies["uid"]?.Value;

                // Check if any of the cookie values are null
                if (!string.IsNullOrEmpty(uid) && !string.IsNullOrEmpty(username) && !string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(profilePicture))
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
                        // Open database connection
                        connection.Open();

                        // Create OracleCommand object to check for existing record
                        using (OracleCommand selectCommand = new OracleCommand(selectSql, connection))
                        {
                            // Bind parameters for SELECT statement
                            selectCommand.Parameters.Add("uid", OracleDbType.Varchar2).Value = uid;
                            selectCommand.Parameters.Add("username", OracleDbType.Varchar2).Value = username;

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
                    Response.Write("One or more cookie values are null or empty.");
                }
            }


        protected void btnLogout_Click(object sender, EventArgs e)
        {
            
        }

        protected void Insert(object sender, EventArgs e)
        {

        }
    }
}