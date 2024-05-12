using PayPalCheckoutSdk.Core;
using PayPalCheckoutSdk.Orders;
using PayPalHttp;
using RestSharp;
using Stripe;
using Stripe.Checkout;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Security.Cryptography.X509Certificates;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.WebRequestMethods;

namespace Test_webform
{

    public partial class billing : System.Web.UI.Page
    {
        private static string PayPalClientId => System.Configuration.ConfigurationManager.AppSettings["PaypalClientId"];
        private static string PayPalClientSecret => System.Configuration.ConfigurationManager.AppSettings["PayPalClientSecret"];

        protected async void Page_Load(object sender, EventArgs e)
        {
            
            if (Request.QueryString["token"] != null)
            {
                string approvalToken = Request.QueryString["token"];
                var response = await captureOrder(approvalToken);

                if (response != null)
                {
                    Order result = response.Result<Order>();
                    Label1.Text = result.Status;
                    if (result.Status.ToUpper() == "COMPLETED") // Check if the payment is completed
                    {
                        // Display alert message
                        ClientScript.RegisterStartupScript(this.GetType(), "PaymentCompleted", "alert('The payment has been completed.');", true);
                        btnPayment.Enabled = false;
                    }
                }
            }
        }

        protected async void btnGcash_Click(object sender, EventArgs e)
        {
            var options = new RestClientOptions("https://api.paymongo.com/v1/checkout_sessions");
            var client = new RestClient(options);
            var request = new RestRequest("");
            request.AddHeader("accept", "application/json");
            request.AddHeader("authorization", "Basic c2tfdGVzdF9RVUZheHZES01KS2JqZnpDSmpaNGNwMmQ6");
            request.AddJsonBody("{\"data\":{\"attributes\":{\"send_email_receipt\":true,\"show_description\":true,\"show_line_items\":true,\"cancel_url\":\"https://localhost:44308/login-page/billing-methods.aspx?success=true\",\"payment_method_types\":[\"gcash\",\"paymaya\"],\"line_items\":[{\"currency\":\"PHP\",\"description\":\"Pogi mo ya\",\"amount\":1000000,\"name\":\"Red Dress\",\"quantity\":1}],\"description\":\"TY\",\"reference_number\":\"213123faq\",\"success_url\":\"https://localhost:44308/login-page/payment.aspx\",\"statement_descriptor\":\"Dress is your deserve.\"}}}", false);
            var response = await client.PostAsync(request);

            // Check if the response is successful
            if (response.IsSuccessful)
            {
                // Get the checkout URL from the response content
                var jsonResponse = Newtonsoft.Json.JsonConvert.DeserializeObject<dynamic>(response.Content);
                var checkoutUrl = jsonResponse.data.attributes.checkout_url;

                // Redirect the user to the checkout URL
                Response.Redirect(checkoutUrl.ToString());
            }
        }

        protected async void btnPayment_Click(object sender, EventArgs e)
        {
            var response = await createOrder();
            Response.Redirect(response);
        }

        public async static Task<string> createOrder()
        {
            var order = new OrderRequest()
            {
                CheckoutPaymentIntent = "CAPTURE",
                PurchaseUnits = new List<PurchaseUnitRequest>()
                {
                    new PurchaseUnitRequest()
                    {
                        AmountWithBreakdown = new AmountWithBreakdown()
                        {
                            CurrencyCode = "PHP",
                            Value = "1000.00"
                        }
                    }
                },
                ApplicationContext = new ApplicationContext()
                {
                    ReturnUrl = "https://localhost:44308/login-page/billing-methods.aspx?success=true",
                    CancelUrl = "https://localhost:44308/login-page/payment.aspx"
                }
            };

            var request = new OrdersCreateRequest();
            request.Prefer("return=representation");
            request.RequestBody(order);
            var environment = new SandboxEnvironment(PayPalClientId, PayPalClientSecret);
            var response = await new PayPalHttpClient(environment).Execute(request);
            var result = response.Result<Order>();

            return GetApprovalUrl(result);
        }

        public async static Task<PayPalHttp.HttpResponse> captureOrder(string token)
        {
            var request = new OrdersCaptureRequest(token);
            request.RequestBody(new OrderActionRequest());
            var environment = new SandboxEnvironment(PayPalClientId, PayPalClientSecret);
            var response = await new PayPalHttpClient(environment).Execute(request);
            return response;
        }

        public static string GetApprovalUrl(Order result)
        {
            if (result.Links != null)
            {
                LinkDescription approvalLink = result.Links.Find(link => link.Rel.ToLower() == "approve");
                if (approvalLink != null)
                {
                    return approvalLink.Href;
                }
            }
            return "https://localhost:44308/login-page/billing-methods.aspx?success=true";
        }
    }
}