using System;
using System.Web.UI;

namespace ReeseJonesHoldingsUIs
{
    public partial class WelcomeSuperAdmin : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Get username from session
                if (Session["Username"] != null)
                {
                    litUsername.Text = Session["Username"].ToString();
                }
                else
                {
                    litUsername.Text = "Guest";
                }
            }
        }
    }
}
