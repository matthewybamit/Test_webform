using Oracle.ManagedDataAccess.Client;
using System;
using System.Configuration;
using System.Web.UI;


namespace Test_webform
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["productId"] != null)
                {
                    string productId = Request.QueryString["productId"];
                    productID.Value = productId; // Set the productId to the hidden field
                }
            }
        }

        protected void InsertBooking(object sender, EventArgs e)
        {
            // Retrieve form values
                string selectedDate = date.Text;
                string selectedTime = meetingTime.Text;

                string uid = uidInput.Value;
                string productId = productID.Value;
                string bookingDate = $"{selectedDate} {selectedTime}"; // Assuming booking date is current date/time
                string bookingStatus = "Pending"; // Assuming booking status is initially set to "Pending"
                string bookingNote = message.Text; // Assuming message field is used for booking notes
                string bookingContact = contactnum.Text;



            // Create connection to Oracle database
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["OracleConString"].ConnectionString;
            using (OracleConnection connection = new OracleConnection(connectionString))
                {
                    // Construct SQL INSERT statement
                    string insertStatement = "INSERT INTO BOOKING (U_ID, PRODUCT_ID, BOOKING_DATE, BOOKING_STATUS, BOOKING_NOTE, BOOKING_CONTACT) VALUES (:1, :2, :3, :4, :5, :6)";

                    // Create command and assign parameters
                    using (OracleCommand command = new OracleCommand(insertStatement, connection))
                    {
                        command.Parameters.Add(":1", OracleDbType.Varchar2).Value = uid;
                        command.Parameters.Add(":2", OracleDbType.Int32).Value = int.Parse(productId);
                        command.Parameters.Add(":3", OracleDbType.Date).Value = bookingDate;
                        command.Parameters.Add(":4", OracleDbType.Varchar2).Value = bookingStatus;
                        command.Parameters.Add(":5", OracleDbType.Varchar2).Value = bookingNote;
                        command.Parameters.Add(":6", OracleDbType.Varchar2).Value = bookingContact;

                        // Open connection, execute command, and close connection
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }

                // Redirect or display success message
                Response.Redirect("Webform4.aspx"); // Redirect to a success page
            
           
        }
    }
}
