using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using ReeseJonesHoldingsUIs.Models;
using ReeseJonesHoldingsUIs.Services;

namespace ReeseJonesHoldingsUIs.Pages
{
    public partial class LeaveRequestPage : Page
    {
        private LocalStorageService _storageService;

        protected void Page_Load(object sender, EventArgs e)
        {
            _storageService = new LocalStorageService(this);

            if (!IsPostBack)
            {
                LoadRecentRequests();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            try
            {
                // Validate date range
                if (dateEnd.Date < dateStart.Date)
                {
                    _storageService.ShowError("End date cannot be before start date.", lblMessage);
                    return;
                }

                // Get existing leave requests
                var leaveRequests = _storageService.GetData<LeaveRequest>("leaveRequests", hfLeaveRequests);

                // Create new leave request
                var newRequest = new LeaveRequest
                {
                    Id = leaveRequests.Any() ? leaveRequests.Max(lr => lr.Id) + 1 : 1,
                    EmployeeName = txtEmployeeName.Text.Trim(),
                    LeaveType = cmbLeaveType.Value?.ToString() ?? string.Empty,
                    StartDate = dateStart.Date,
                    EndDate = dateEnd.Date,
                    Reason = txtReason.Text.Trim(),
                    Status = "Pending",
                    SubmittedDate = DateTime.Now
                };

                // Add to list
                leaveRequests.Add(newRequest);

                // Save back to localStorage
                _storageService.SetData("leaveRequests", leaveRequests, hfLeaveRequests);

                // Show success message
                lblMessage.Text = "Leave request submitted successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;

                // Clear form
                ClearForm();

                // Reload grid
                LoadRecentRequests();
            }
            catch (Exception ex)
            {
                _storageService.ShowError($"Error submitting leave request: {ex.Message}", lblMessage);
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearForm();
            lblMessage.Text = string.Empty;
        }

        private void ClearForm()
        {
            txtEmployeeName.Text = string.Empty;
            cmbLeaveType.SelectedIndex = -1;
            dateStart.Value = null;
            dateEnd.Value = null;
            txtReason.Text = string.Empty;
        }

        private void LoadRecentRequests()
        {
            try
            {
                var leaveRequests = _storageService.GetData<LeaveRequest>("leaveRequests", hfLeaveRequests);

                // Get the 5 most recent requests
                var recentRequests = leaveRequests
                    .OrderByDescending(lr => lr.SubmittedDate)
                    .Take(5)
                    .ToList();

                gridRecentRequests.DataSource = recentRequests;
                gridRecentRequests.DataBind();
            }
            catch (Exception ex)
            {
                _storageService.ShowError($"Error loading recent requests: {ex.Message}", lblMessage);
            }
        }
    }
}
