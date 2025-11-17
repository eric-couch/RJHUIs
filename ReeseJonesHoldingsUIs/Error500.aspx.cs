using System;
using System.Web.UI;

namespace ReeseJonesHoldingsUIs
{
    public partial class Error500 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.StatusCode = 500;
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void btnRetry_Click(object sender, EventArgs e)
        {
            // Try to redirect back to the referring page
            string referrer = Request.UrlReferrer?.ToString();
            if (!string.IsNullOrEmpty(referrer))
            {
                Response.Redirect(referrer);
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }
}
