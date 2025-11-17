using System;
using System.Web.UI;

namespace ReeseJonesHoldingsUIs
{
    public partial class Error404 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.StatusCode = 404;
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}
