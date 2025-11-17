using System;
using System.Web.UI;
using Newtonsoft.Json;
using ReeseJonesHoldingsUIs.Data;

namespace ReeseJonesHoldingsUIs
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Register script to check if localStorage is initialized
                string checkScript = @"
                    if (!isInitialized()) {
                        __doPostBack('InitializeData', '');
                    }
                ";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CheckInitialization", checkScript, true);
                
                // Handle postback for initialization
                if (Request.Form["__EVENTTARGET"] == "InitializeData")
                {
                    InitializeLocalStorage();
                }
            }
        }
        
        private void InitializeLocalStorage()
        {
            try
            {
                // Generate sample data
                var users = SampleDataGenerator.GenerateUsers();
                var leaveRequests = SampleDataGenerator.GenerateLeaveRequests();
                var expenses = SampleDataGenerator.GenerateExpenseReports();
                var surveys = SampleDataGenerator.GenerateSurveys();
                
                // Serialize to JSON
                string usersJson = JsonConvert.SerializeObject(users);
                string leaveRequestsJson = JsonConvert.SerializeObject(leaveRequests);
                string expensesJson = JsonConvert.SerializeObject(expenses);
                string surveysJson = JsonConvert.SerializeObject(surveys);
                
                // Register scripts to populate localStorage
                string initScript = string.Format(@"
                    saveData('users', {0});
                    saveData('leaveRequests', {1});
                    saveData('expenseReports', {2});
                    saveData('surveys', {3});
                    saveData('dataInitialized', 'true');
                ", 
                    JsonConvert.SerializeObject(usersJson),
                    JsonConvert.SerializeObject(leaveRequestsJson),
                    JsonConvert.SerializeObject(expensesJson),
                    JsonConvert.SerializeObject(surveysJson));
                
                Page.ClientScript.RegisterStartupScript(this.GetType(), "InitializeLocalStorage", initScript, true);
            }
            catch (Exception ex)
            {
                // Log error (in production, use proper logging)
                System.Diagnostics.Debug.WriteLine("Error initializing localStorage: " + ex.Message);
            }
        }
    }
}
