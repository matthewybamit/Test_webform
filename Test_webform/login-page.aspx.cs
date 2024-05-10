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
using Google.Apis.Auth.OAuth2.Flows;
using Google.Apis.Auth.OAuth2;
using System.EnterpriseServices;

namespace Test_webform
{
    public partial class WebForm1 : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

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