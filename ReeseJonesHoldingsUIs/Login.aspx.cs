using System;
using System.Web.UI;

namespace ReeseJonesHoldingsUIs
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Clear any existing error messages
                pnlError.CssClass = "error-message";
                
                // Set default focus to username field
                txtUsername.Focus();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                // Validate that all fields are filled
                if (string.IsNullOrWhiteSpace(txtUsername.Text) ||
                    string.IsNullOrWhiteSpace(txtPassword.Text) ||
                    cboRole.Value == null)
                {
                    ShowError("Please fill in all required fields.");
                    return;
                }

                // Get the selected role
                string selectedRole = cboRole.Value.ToString();

                // Store user info in session for the welcome page
                Session["Username"] = txtUsername.Text;
                Session["Role"] = selectedRole;

                // Redirect based on role
                string redirectUrl;
                switch (selectedRole)
                {
                    case "User":
                        redirectUrl = "~/WelcomeUser.aspx";
                        break;
                    case "Admin":
                        redirectUrl = "~/WelcomeAdmin.aspx";
                        break;
                    case "SuperAdmin":
                        redirectUrl = "~/WelcomeSuperAdmin.aspx";
                        break;
                    default:
                        ShowError("Invalid role selected.");
                        return;
                }

                // Perform redirect
                Response.Redirect(redirectUrl, false);
                Context.ApplicationInstance.CompleteRequest();
            }
            catch (Exception ex)
            {
                ShowError($"An error occurred during login: {ex.Message}");
            }
        }

        private void ShowError(string message)
        {
            lblErrorMessage.Text = message;
            pnlError.CssClass = "error-message show";
        }
    }
}
