using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using DevExpress.Web;
using DevExpress.Web.Data;
using ReeseJonesHoldingsUIs.Models;
using ReeseJonesHoldingsUIs.Services;

namespace ReeseJonesHoldingsUIs.Pages
{
    public partial class ExpenseReportPage : Page
    {
        private LocalStorageService _storageService;

        protected void Page_Load(object sender, EventArgs e)
        {
            _storageService = new LocalStorageService(this);
            
            // Always bind the grid - it needs data on every postback for edit controls to work
            LoadExpenses();
        }

        private void LoadExpenses()
        {
            try
            {
                // Use Session to maintain data across postbacks
                List<ExpenseReport> expenses;
                
                if (Session["ExpenseReports"] == null)
                {
                    // First time - try to load from localStorage via hidden field
                    expenses = _storageService.GetData<ExpenseReport>("expenseReports", hfExpenseReports);
                    Session["ExpenseReports"] = expenses;
                }
                else
                {
                    // Use session data on postbacks
                    expenses = (List<ExpenseReport>)Session["ExpenseReports"];
                }

                // Sort by date descending
                var sortedExpenses = expenses
                    .OrderByDescending(exp => exp.ExpenseDate)
                    .ToList();

                gridExpenses.DataSource = sortedExpenses;
                gridExpenses.DataBind();
            }
            catch (Exception ex)
            {
                _storageService.ShowError($"Error loading expenses: {ex.Message}", lblMessage);
            }
        }

        protected void gridExpenses_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {
            try
            {
                var expenses = (List<ExpenseReport>)Session["ExpenseReports"] ?? new List<ExpenseReport>();

                var newExpense = new ExpenseReport
                {
                    Id = expenses.Any() ? expenses.Max(exp => exp.Id) + 1 : 1,
                    ExpenseDate = Convert.ToDateTime(e.NewValues["ExpenseDate"]),
                    Category = e.NewValues["Category"]?.ToString() ?? string.Empty,
                    Amount = Convert.ToDecimal(e.NewValues["Amount"]),
                    Notes = e.NewValues["Notes"]?.ToString() ?? string.Empty
                };

                expenses.Add(newExpense);
                Session["ExpenseReports"] = expenses;
                
                // Also save to localStorage for persistence
                _storageService.SetData("expenseReports", expenses, hfExpenseReports);

                lblMessage.Text = "Expense added successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                
                e.Cancel = true;
                gridExpenses.CancelEdit();
                LoadExpenses();
            }
            catch (Exception ex)
            {
                _storageService.ShowError($"Error adding expense: {ex.Message}", lblMessage);
                e.Cancel = true;
            }
        }

        protected void gridExpenses_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            try
            {
                var expenses = (List<ExpenseReport>)Session["ExpenseReports"] ?? new List<ExpenseReport>();
                var expenseId = Convert.ToInt32(e.Keys["Id"]);
                var expense = expenses.FirstOrDefault(exp => exp.Id == expenseId);

                if (expense != null)
                {
                    expense.ExpenseDate = e.NewValues["ExpenseDate"] != null ? Convert.ToDateTime(e.NewValues["ExpenseDate"]) : expense.ExpenseDate;
                    expense.Category = e.NewValues["Category"]?.ToString() ?? expense.Category;
                    expense.Amount = e.NewValues["Amount"] != null ? Convert.ToDecimal(e.NewValues["Amount"]) : expense.Amount;
                    expense.Notes = e.NewValues["Notes"]?.ToString() ?? expense.Notes;

                    Session["ExpenseReports"] = expenses;
                    
                    // Also save to localStorage for persistence
                    _storageService.SetData("expenseReports", expenses, hfExpenseReports);

                    lblMessage.Text = "Expense updated successfully!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    
                    e.Cancel = true;
                    gridExpenses.CancelEdit();
                    LoadExpenses();
                }
            }
            catch (Exception ex)
            {
                _storageService.ShowError($"Error updating expense: {ex.Message}", lblMessage);
                e.Cancel = true;
            }
        }

        protected void gridExpenses_RowDeleting(object sender, ASPxDataDeletingEventArgs e)
        {
            try
            {
                var expenses = (List<ExpenseReport>)Session["ExpenseReports"] ?? new List<ExpenseReport>();
                var expenseId = Convert.ToInt32(e.Keys["Id"]);
                var expense = expenses.FirstOrDefault(exp => exp.Id == expenseId);

                if (expense != null)
                {
                    expenses.Remove(expense);
                    Session["ExpenseReports"] = expenses;
                    
                    // Also save to localStorage for persistence
                    _storageService.SetData("expenseReports", expenses, hfExpenseReports);

                    lblMessage.Text = "Expense deleted successfully!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    
                    e.Cancel = true;
                    LoadExpenses();
                }
            }
            catch (Exception ex)
            {
                _storageService.ShowError($"Error deleting expense: {ex.Message}", lblMessage);
                e.Cancel = true;
            }
        }
    }
}
