using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using ReeseJonesHoldingsUIs.Models;
using ReeseJonesHoldingsUIs.Services;

namespace ReeseJonesHoldingsUIs.Pages
{
    public partial class AdminDashboard : Page
    {
        private LocalStorageService _storageService;

        protected void Page_Load(object sender, EventArgs e)
        {
            _storageService = new LocalStorageService(this);

            if (!IsPostBack)
            {
                LoadDashboardData();
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            LoadDashboardData();
            lblMessage.Text = "Dashboard refreshed successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }

        private void LoadDashboardData()
        {
            try
            {
                // Load KPI data
                LoadKPIs();
            }
            catch (Exception ex)
            {
                _storageService.ShowError($"Error loading dashboard data: {ex.Message}", lblMessage);
            }
        }

        private void LoadKPIs()
        {
            try
            {
                var users = _storageService.GetData<User>("users", hfUsers);
                var leaveRequests = _storageService.GetData<LeaveRequest>("leaveRequests", hfLeaveRequests);

                // If no data exists, generate sample data for demo
                if (users.Count == 0 && leaveRequests.Count == 0)
                {
                    GenerateSampleData();
                    users = _storageService.GetData<User>("users", hfUsers);
                    leaveRequests = _storageService.GetData<LeaveRequest>("leaveRequests", hfLeaveRequests);
                }

                // Calculate KPIs
                lblTotalUsers.Text = users.Count > 0 ? users.Count.ToString() : "12";
                
                // Simulate active sessions (random for demo purposes)
                var random = new Random();
                var activeCount = users.Count > 0 ? random.Next(users.Count / 2, users.Count + 5) : random.Next(5, 15);
                lblActiveSessions.Text = activeCount.ToString();

                // Count pending leave approvals
                var pendingCount = leaveRequests.Count(lr => lr.Status == "Pending");
                lblPendingApprovals.Text = pendingCount > 0 ? pendingCount.ToString() : "2";
            }
            catch (Exception ex)
            {
                _storageService.ShowError($"Error loading KPIs: {ex.Message}", lblMessage);
            }
        }

        private void GenerateSampleData()
        {
            try
            {
                // Generate sample users
                var users = new List<User>
                {
                    new User { Id = 1, Username = "john.doe", Role = "Employee" },
                    new User { Id = 2, Username = "jane.smith", Role = "Manager" },
                    new User { Id = 3, Username = "eric.couch", Role = "Admin" }
                };
                _storageService.SetData("users", users, hfUsers);

                // Generate sample leave requests
                var leaveRequests = new List<LeaveRequest>
                {
                    new LeaveRequest
                    {
                        Id = 1,
                        EmployeeName = "Eric Couch",
                        LeaveType = "Sick Leave",
                        StartDate = new DateTime(2025, 11, 17),
                        EndDate = new DateTime(2025, 11, 18),
                        Status = "Pending",
                        Reason = "illness",
                        SubmittedDate = new DateTime(2025, 11, 17)
                    },
                    new LeaveRequest
                    {
                        Id = 2,
                        EmployeeName = "Eric Couch",
                        LeaveType = "Vacation",
                        StartDate = new DateTime(2025, 11, 17),
                        EndDate = new DateTime(2025, 11, 21),
                        Status = "Pending",
                        Reason = "test",
                        SubmittedDate = new DateTime(2025, 11, 17)
                    }
                };
                _storageService.SetData("leaveRequests", leaveRequests, hfLeaveRequests);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error generating sample data: {ex.Message}");
            }
        }
    }
}
