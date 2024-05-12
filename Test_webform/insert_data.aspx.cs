using System;
using System.IO;
using System.Web;
using System.Web.UI;
using Oracle.ManagedDataAccess.Client;

namespace Test_webform
{
    public partial class insert_data : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Read the request body to get the JSON data
            string requestBody;
            using (var reader = new StreamReader(Request.InputStream))
            {
                requestBody = reader.ReadToEnd();
            }

            // Deserialize the JSON data into an object
            dynamic jsonData;
            try
            {
                jsonData = Newtonsoft.Json.JsonConvert.DeserializeObject(requestBody);
            }
            catch (Exception ex)
            {
                // Handle JSON parsing error
                Response.StatusCode = 400; // Bad Request
                Response.StatusDescription = "Invalid JSON data";
                Response.Write("Error parsing JSON data: " + ex.Message);
                Response.End();
                return;
            }

            // Check if JSON data is null
            if (jsonData == null)
            {
                // Handle case when jsonData is null
                Response.StatusCode = 400; // Bad Request
                Response.StatusDescription = "Invalid JSON data";
                Response.Write("No JSON data found in request body");
                Response.End();
                return;
            }

            // Retrieve data from the JSON object
            string uid = jsonData.uid;
            string email = jsonData.email;

            // Validate and sanitize input if necessary

            // Insert data into the database
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["OracleConString"].ConnectionString;
            using (var connection = new OracleConnection(connectionString))
            {
                string query = "INSERT INTO TRYING2 (UID_2, EMAIL_2) VALUES (:uid, :email)";
                using (var command = new OracleCommand(query, connection))
                {
                    command.Parameters.Add(":uid", OracleDbType.Varchar2).Value = uid;
                    command.Parameters.Add(":email", OracleDbType.Varchar2).Value = email;
                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    // Optionally, you can check rowsAffected to verify if the data was inserted successfully
                }
            }
        }
    }
}