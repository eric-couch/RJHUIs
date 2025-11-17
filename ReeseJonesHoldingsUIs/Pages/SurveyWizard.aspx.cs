using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using ReeseJonesHoldingsUIs.Models;
using ReeseJonesHoldingsUIs.Services;

namespace ReeseJonesHoldingsUIs.Pages
{
    public partial class SurveyWizard : Page
    {
        private LocalStorageService _storageService;

        protected void Page_Load(object sender, EventArgs e)
        {
            _storageService = new LocalStorageService(this);

            if (!IsPostBack)
            {
                // Initialize with empty confirmation labels
                UpdateConfirmation();
            }
        }

        protected void btnNextDemographics_Click(object sender, EventArgs e)
        {
            if (!ValidateDemographics())
                return;

            // Store values in ViewState
            ViewState["Name"] = txtName.Text.Trim();
            ViewState["Age"] = spinAge.Number;
            ViewState["Location"] = txtLocation.Text.Trim();

            // Move to next tab
            pageControl.ActiveTabIndex = 1;
        }

        protected void btnPreviousPreferences_Click(object sender, EventArgs e)
        {
            // Move to previous tab
            pageControl.ActiveTabIndex = 0;
        }

        protected void btnNextPreferences_Click(object sender, EventArgs e)
        {
            if (radioPreference.SelectedItem == null)
            {
                _storageService.ShowError("Please select your satisfaction level.", lblMessage);
                return;
            }

            // Store values in ViewState
            ViewState["PreferenceAnswer"] = radioPreference.SelectedItem.Value;
            ViewState["Comments"] = txtComments.Text.Trim();

            // Update confirmation labels
            UpdateConfirmation();

            // Move to confirmation tab
            pageControl.ActiveTabIndex = 2;
        }

        protected void btnPreviousConfirmation_Click(object sender, EventArgs e)
        {
            // Move to previous tab
            pageControl.ActiveTabIndex = 1;
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            // Clear all form fields
            txtName.Text = string.Empty;
            spinAge.Number = 25;
            txtLocation.Text = string.Empty;
            radioPreference.SelectedIndex = -1;
            txtComments.Text = string.Empty;

            // Clear ViewState
            ViewState.Clear();

            // Reset to first tab
            pageControl.ActiveTabIndex = 0;

            // Clear message
            lblMessage.Text = string.Empty;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                // Get existing surveys
                var surveys = _storageService.GetData<Survey>("surveys", hfSurveys);                // Create new survey from ViewState
                var newSurvey = new Survey
                {
                    Id = surveys.Any() ? surveys.Max(s => s.Id) + 1 : 1,
                    Name = ViewState["Name"]?.ToString() ?? string.Empty,
                    Age = Convert.ToInt32(ViewState["Age"] ?? 25),
                    Location = ViewState["Location"]?.ToString() ?? string.Empty,
                    PreferenceAnswer = ViewState["PreferenceAnswer"]?.ToString() ?? string.Empty,
                    CompletedDate = DateTime.Now
                };

                // Add to list
                surveys.Add(newSurvey);

                // Save back to localStorage
                _storageService.SetData("surveys", surveys, hfSurveys);

                // Show success message
                lblMessage.Text = $"Survey submitted successfully! Thank you, {newSurvey.Name}.";
                lblMessage.ForeColor = System.Drawing.Color.Green;

                // Reset form after a short delay would be better with client-side code,
                // but for now just clear the form
                btnReset_Click(sender, e);
            }
            catch (Exception ex)
            {
                _storageService.ShowError($"Error submitting survey: {ex.Message}", lblMessage);
            }
        }

        private bool ValidateDemographics()
        {
            if (string.IsNullOrWhiteSpace(txtName.Text))
            {
                _storageService.ShowError("Name is required.", lblMessage);
                return false;
            }

            if (spinAge.Number < 18 || spinAge.Number > 120)
            {
                _storageService.ShowError("Please enter a valid age between 18 and 120.", lblMessage);
                return false;
            }

            if (string.IsNullOrWhiteSpace(txtLocation.Text))
            {
                _storageService.ShowError("Location is required.", lblMessage);
                return false;
            }

            return true;
        }

        private void UpdateConfirmation()
        {
            lblConfirmName.Text = ViewState["Name"]?.ToString() ?? "(Not provided)";
            lblConfirmAge.Text = ViewState["Age"]?.ToString() ?? "(Not provided)";
            lblConfirmLocation.Text = ViewState["Location"]?.ToString() ?? "(Not provided)";
            lblConfirmPreference.Text = ViewState["PreferenceAnswer"]?.ToString() ?? "(Not selected)";
            
            var comments = ViewState["Comments"]?.ToString();
            lblConfirmComments.Text = string.IsNullOrWhiteSpace(comments) ? "(No comments)" : comments;
        }
    }
}
