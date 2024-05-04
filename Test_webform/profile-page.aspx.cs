﻿using System;
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
    public partial class profile_page : System.Web.UI.Page
    {


        protected void prof_page(object sender, EventArgs e)
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
                    GoogleProfile2 profile = new JavaScriptSerializer().Deserialize<GoogleProfile2>(json);
                    lblId.Text = profile.Id;
                    lblName.Text = profile.Name;
                    lblEmail.Text = profile.Email;
                    ProfileImage.ImageUrl = profile.Picture;
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







        protected void Logout(object sender, EventArgs e)
        {

        }
    }
}