using System;
using System.Web.UI;

namespace ReeseJonesHoldingsUIs
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Page_Load handled by Site.Master for localStorage initialization
        }

        protected void btnLeaveRequest_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/LeaveRequest.aspx");
        }

        protected void btnExpenseReport_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/ExpenseReport.aspx");
        }

        protected void btnSurveyWizard_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/SurveyWizard.aspx");
        }

        protected void btnAdminDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/AdminDashboard.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}
