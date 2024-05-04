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
using ASPSnippets.GoogleAPI;


namespace Test_webform
{
    public partial class Test_webform : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
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

                /*GoogleConnect.ClientId = "35298655443-6geak9840cbrbia04o2gihnbouragbq1.apps.googleusercontent.com";
                GoogleConnect.ClientSecret = "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";
                GoogleConnect.RedirectUri = Request.Url.AbsoluteUri.Split('?')[0];

                if (!this.IsPostBack)
                {
                    string code = Request.QueryString["code"];
                    if (!string.IsNullOrEmpty(code))
                    {
                        GoogleConnect connect = new GoogleConnect();
                        string json = connect.Fetch("me", code);
                        GoogleProfile profile = new JavaScriptSerializer().Deserialize<GoogleProfile>(json);
                        lblId.Text = profile.Id;
                        lblName.Text = profile.Name;
                        lblEmail.Text = profile.Email;
                        ProfileImage.ImageUrl = profile.Picture;
                        //pnlProfile.Visible = true;
                    }
                    if (Request.QueryString["error"] == "access_denied")
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Access denied.')", true);
                    }*/
                // This page will handle the AJAX request to insert data into Oracle database
                //string uid = Request.Form["uid"];
                //string username = Request.Form["username"];
                //string email = Request.Form["email"];
                //string profilePicture = Request.Form["profilePicture"];

                // Call method to insert data into Oracle database
                //InsertData(uid, username, email, profilePicture);
            }
        }

        public void RetrieveDb(GoogleProfile3 profile)
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
                    command.Parameters.Add("p_uid", OracleDbType.Varchar2).Value = profile.Id;

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

                            profilePic.ImageUrl = reader["PROFILE_PIC"].ToString();
                        }
                        else
                        {
                            // Handle the case where no data is retrieved (e.g., display a message or set default values)
                            lbluid.Text = "User not found";
                            lblusername.Text = string.Empty;
                            txtEmail.Text = string.Empty;
                            profilePic.ImageUrl = string.Empty;
                        }
                    }
                }
            }
        }

        public class GoogleProfile
        {
            public string Id { get; set; }
            public string Name { get; set; }
            public string Email { get; set; }
            public string Picture { get; set; }

            public void InsertIntoDB()
            {
                // Retrieve the connection string from configuration
                string connectionString = ConfigurationManager.ConnectionStrings["OracleConString"].ConnectionString;

                // SQL query to insert data into the Accounts table
                string query = "INSERT INTO ACCOUNTS (U_ID, USERNAME, EMAIL, PROFILE_PIC) VALUES (:uid, :username, :email, :profile_pic)";

                // Create connection and command objects
                using (OracleConnection connection = new OracleConnection(connectionString))
                using (OracleCommand command = new OracleCommand(query, connection))
                {
                    // Set parameters
                    command.Parameters.Add("p_uid", OracleDbType.Varchar2).Value = Id;
                    command.Parameters.Add("p_username", OracleDbType.Varchar2).Value = Name;
                    command.Parameters.Add("p_email", OracleDbType.Varchar2).Value = Email;
                    command.Parameters.Add("p_profile_pic", OracleDbType.Varchar2).Value = Picture;

                    // Open connection and execute command
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        public static void InsertDataDB(string uid, string username, string email, string profilePicture)
        {
            
                // Connection string for Oracle database
                string connectionString = ConfigurationManager.ConnectionStrings["Accounts"].ConnectionString;

                // SQL INSERT statement
                string insertSql = "INSERT INTO GOOGLE_ACC (ID, USERNAME, EMAIL, PROFILE_PIC) " +
                                    "VALUES (:uid, :username, :email, :profilePicture)";

                // Create OracleConnection object
                using (OracleConnection connection = new OracleConnection(connectionString))
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
                        connection.Open();
                        insertCommand.ExecuteNonQuery();
                    }
                }
            }
            
        





        /*protected void Logout(object sender, EventArgs e)
        {

        }*/
    }
}