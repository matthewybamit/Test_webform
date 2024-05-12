using System;
using System.Web.UI;
using Oracle.ManagedDataAccess.Client;

namespace Test_webform
{
    public partial class Book : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // You can perform any necessary initialization here
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            // Retrieve values from input fields
            string uid = uidInput.Value;
            string email = emailInput.Value;
            string profilePicture = profilePictureInput.Value;
            string username = usernameInput.Value;

            // Insert data into the database
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["OracleConString"].ConnectionString;
            using (var connection = new OracleConnection(connectionString))
            {
                string query = "INSERT INTO ACCOUNTS (U_ID, USERNAME, EMAIL, PROFILE_PIC) VALUES (:1, :2, :3, :4)";
                using (var command = new OracleCommand(query, connection))
                {
                    command.Parameters.Add(":1", OracleDbType.Varchar2).Value = uid;
                    command.Parameters.Add(":2", OracleDbType.Varchar2).Value = username;
                    command.Parameters.Add(":3", OracleDbType.Varchar2).Value = email;
                    command.Parameters.Add(":4", OracleDbType.Varchar2).Value = profilePicture;
                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    // Optionally, you can check rowsAffected to verify if the data was inserted successfully
                }
            }
        }
    }
}
