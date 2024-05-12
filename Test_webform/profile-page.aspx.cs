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
using static Test_webform.Test_webform;
using Newtonsoft.Json;
using System.IO;

namespace Test_webform
{
    public partial class profile_page : System.Web.UI.Page
    {


        protected void prof_page(object sender, EventArgs e)
        {

            if (Request.HttpMethod == "POST")
            {
                // Read the request body to get the JSON data sent from the client
                string requestBody;
                using (var reader = new StreamReader(Request.InputStream))
                {
                    requestBody = reader.ReadToEnd();
                }

                // Deserialize the JSON data into a C# object
                var userData = JsonConvert.DeserializeObject<UserData>(requestBody);

                // Call a method to process the received user data (e.g., insert it into the database)
                InsertUserData(userData);
            }
        }

        // Define a class to represent the user data structure
        public class UserData
        {
            public string DisplayName { get; set; }
            public string Email { get; set; }
            public string PhotoURL { get; set; }
            public string UID { get; set; }
        }

        protected void InsertUserData(UserData userData)
        {
            // Retrieve the connection string from configuration
            string connectionString = ConfigurationManager.ConnectionStrings["OracleConString"].ConnectionString;

            // SQL query to insert data into the Accounts table
            string insertQuery = "INSERT INTO ACCOUNTS (U_ID, USERNAME, EMAIL, PROFILE_PIC) VALUES (:p_uid, :p_username, :p_email, :p_profile_pic)";

            // Create connection object
            using (OracleConnection connection = new OracleConnection(connectionString))
            {
                // Create command object
                using (OracleCommand command = new OracleCommand(insertQuery, connection))
                {
                    // Set parameters for the query
                    command.Parameters.Add("p_uid", OracleDbType.Varchar2).Value = userData.UID;
                    command.Parameters.Add("p_username", OracleDbType.Varchar2).Value = userData.DisplayName;
                    command.Parameters.Add("p_email", OracleDbType.Varchar2).Value = userData.Email;
                    command.Parameters.Add("p_profile_pic", OracleDbType.Varchar2).Value = userData.PhotoURL;

                    // Open connection
                    connection.Open();

                    // Execute the SQL command to insert data
                    int rowsAffected = command.ExecuteNonQuery();

                    // Check if data insertion was successful
                    if (rowsAffected > 0)
                    {
                        // Output success message to console
                        Console.WriteLine("User data inserted successfully.");
                    }
                    else
                    {
                        // Output failure message to console
                        Console.WriteLine("Failed to insert user data.");
                    }
                }
            }
        }


    public void RetrieveDb4()
        {
            string userId = "118065886279397008840";

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
                    command.Parameters.Add("p_uid", OracleDbType.Varchar2).Value = userId;

                    // Open connection
                    connection.Open();

                    // Execute the query and retrieve data
                    using (OracleDataReader reader = command.ExecuteReader())
                    {
                        // Check if there is data to read
                        if (reader.Read())
                        {
                            // Populate ASP.NET controls with retrieved user data
                            //lbluid.Text = reader["U_ID"].ToString();
                            //lblusername.Text = reader["USERNAME"].ToString();
                            //txtEmail.Text = reader["EMAIL"].ToString();
                            // Assuming the profile picture is stored as a URL
                            //profilePic.ImageUrl = reader["PROFILE_PIC"].ToString();
                        }
                        else
                        {
                            // Handle the case where no data is retrieved (e.g., display a message or set default values)
                            // For example:
                            //lbluid.Text = "User not found";
                            //lblusername.Text = string.Empty;
                            //txtEmail.Text = string.Empty;
                            //profilePic.ImageUrl = string.Empty;
                        }
                    }
                }
            }
        }

        public class GoogleProfile2
        {
            public string Id { get; set; }
            public string Name { get; set; }
            public string Email { get; set; }
            public string Picture { get; set; }
        }

        public static void InsertData(string uid, string username, string email, string profilePicture)
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




        protected void btnLogout_Click(object sender, EventArgs e)
        {

        }


        protected void Logout(object sender, EventArgs e)
        {

        }
    }
}
