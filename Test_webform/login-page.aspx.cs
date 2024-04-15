using System;
using Facebook;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASPSnippets.GoogleAPI;
using ASPSnippets.FaceBookAPI;
using System.Web.Script.Serialization;

namespace Test_webform
{
    public partial class WebForm1 : System.Web.UI.Page
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
                    GoogleProfile profile = new JavaScriptSerializer().Deserialize<GoogleProfile>(json);
                    //lblId.Text = profile.Id;
                    //lblName.Text = profile.Name;
                    //lblEmail.Text = profile.Email;
                    //lblVerified.Text = profile.Verified_Email;
                    //imgProfile.ImageUrl = profile.Picture;
                    //pnlProfile.Visible = true;
                    //btnLogin.Enabled = false;
                }
            }
        }

        protected void FBPage(object sender, EventArgs e)
        {
            FaceBookConnect.API_Key = "447751964338432";
            FaceBookConnect.API_Secret = "599c4f63b2500ed5d12dbacd694faeaa";
            FaceBookConnect.Version = "v19.0";
            if (!this.IsPostBack)
            {
                if (Request.QueryString["error"] == "access_denied")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('User has denied access.')", true);
                    return;
                }

                string code = Request.QueryString["code"];
                if (!string.IsNullOrEmpty(code))
                {
                    string data = FaceBookConnect.Fetch(code, "me");
                    FaceBookUser faceBookUser = new JavaScriptSerializer().Deserialize<FaceBookUser>(data);
                    //pnlFaceBookUser.Visible = true;
                    //lblId.Text = faceBookUser.Id;
                    //lblName.Text = faceBookUser.Name;
                    //lblEmail.Text = faceBookUser.Email;
                    //ProfileImage.ImageUrl = faceBookUser.Picture.Data.Url;
                    //btnLogin.Enabled = false;
                }
            }
    }

            protected void Login(object sender, EventArgs e)
        {
            GoogleConnect.Authorize("profile", "email");
        }

        protected void FBLogin(object sender, EventArgs e)
        {

            //FaceBookConnect.Authorize("user_photos,email", Request.Url.AbsoluteUri.Split('?')[0]);
            var fb = new FacebookClient();
            var loginUrl = fb.GetLoginUrl(new
            {
                client_id = "447751964338432",
                client_secret = "599c4f63b2500ed5d12dbacd694faeaa",
                redirect_uri = "https://localhost:44308/login-page/",
                response_type = "code",
                scope = "email"
            });

            Response.Redirect(loginUrl.AbsoluteUri);
        }

        protected void Logout(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("login-page.aspx");
        }


        public class GoogleProfile
        {
            public string Id { get; set; }
            public string Name { get; set; }
            public string Picture { get; set; }
            public string Email { get; set; }
            //public string Verified_Email { get; set; }
        }

        public class FaceBookUser
        {
            public string Id { get; set; }
            public string Name { get; set; }
            public string Email { get; set; }
            public FaceBookUserPicture Picture { get; set; }
        }

        public class FaceBookUserPicture
        {
            public Data Data { get; set; }
        }

        public class Data
        {
            public string Url { get; set; }
        }
    }
}