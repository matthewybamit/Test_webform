using System;
using System.Configuration;
using System.Data;
using Oracle.ManagedDataAccess.Client;

namespace Test_webform
{
    public partial class user_profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static string InsertUserData(string uid, string username, string email, string profilePicture)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["OracleConString"].ConnectionString;

                using (OracleConnection connection = new OracleConnection(connectionString))
                {
                    string query = "INSERT INTO ACCOUNTS (U_ID, USERNAME, EMAIL, PROFILE_PIC) VALUES (:uid, :username, :email, :profilePicture)";

                    using (OracleCommand command = new OracleCommand(query, connection))
                    {
                        command.CommandType = CommandType.Text;
                        command.Parameters.Add("uid", OracleDbType.Varchar2).Value = uid;
                        command.Parameters.Add("username", OracleDbType.Varchar2).Value = username;
                        command.Parameters.Add("email", OracleDbType.Varchar2).Value = email;
                        command.Parameters.Add("profilePicture", OracleDbType.Varchar2).Value = profilePicture;

                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();

                        // Log the SQL query and number of rows affected
                        System.Diagnostics.Debug.WriteLine("SQL Query: " + query);
                        System.Diagnostics.Debug.WriteLine("Rows Affected: " + rowsAffected);

                        return "User data inserted successfully into Oracle database.";
                    }
                }
            }
            catch (Exception ex)
            {
                // Log exception for debugging
                System.Diagnostics.Debug.WriteLine("Error inserting user data into Oracle database: " + ex.Message);
                return "Error inserting user data into Oracle database: " + ex.Message;
            }
        }

        protected void Logout(object sender, EventArgs e)
        {
            // Handle logout functionality if needed
        }
    }
}
