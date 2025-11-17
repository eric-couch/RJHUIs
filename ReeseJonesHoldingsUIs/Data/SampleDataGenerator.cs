using System;
using System.Collections.Generic;
using ReeseJonesHoldingsUIs.Models;

namespace ReeseJonesHoldingsUIs.Data
{
    public static class SampleDataGenerator
    {
        private static Random _random = new Random(42); // Seed for consistency
        
        public static List<User> GenerateUsers()
        {
            return new List<User>
            {
                new User { Id = 1, Username = "admin", Role = "Admin" },
                new User { Id = 2, Username = "john.manager", Role = "Manager" },
                new User { Id = 3, Username = "sarah.manager", Role = "Manager" },
                new User { Id = 4, Username = "bob.employee", Role = "Employee" },
                new User { Id = 5, Username = "alice.employee", Role = "Employee" }
            };
        }
        
        public static List<LeaveRequest> GenerateLeaveRequests()
        {
            var requests = new List<LeaveRequest>();
            var employees = new[] { "John Smith", "Sarah Johnson", "Michael Brown", "Emily Davis", 
                                   "Robert Wilson", "Jennifer Martinez", "David Anderson", "Lisa Garcia" };
            var leaveTypes = new[] { "Vacation", "Sick", "Personal", "Bereavement" };
            var statuses = new[] { "Approved", "Approved", "Approved", "Approved", "Approved", "Approved", 
                                  "Pending", "Pending", "Pending", "Rejected" };
            var reasons = new[] { "Family vacation", "Medical appointment", "Personal matters", 
                                 "Family emergency", "Planned time off", "Doctor visit", 
                                 "Mental health day", "Wedding attendance" };
            
            for (int i = 1; i <= 20; i++)
            {
                var submittedDate = DateTime.Now.AddDays(-_random.Next(5, 180));
                var startDate = submittedDate.AddDays(_random.Next(5, 30));
                var duration = _random.Next(1, 11);
                
                requests.Add(new LeaveRequest
                {
                    Id = i,
                    EmployeeName = employees[_random.Next(employees.Length)],
                    LeaveType = leaveTypes[_random.Next(leaveTypes.Length)],
                    StartDate = startDate,
                    EndDate = startDate.AddDays(duration),
                    Reason = reasons[_random.Next(reasons.Length)],
                    Status = statuses[_random.Next(statuses.Length)],
                    SubmittedDate = submittedDate
                });
            }
            
            return requests;
        }
        
        public static List<ExpenseReport> GenerateExpenseReports()
        {
            var expenses = new List<ExpenseReport>();
            var categories = new[] { "Travel", "Travel", "Travel", "Travel", 
                                    "Meals", "Meals", "Meals", 
                                    "Supplies", "Supplies", 
                                    "Equipment", "Equipment", "Equipment" };
            var notes = new Dictionary<string, string[]>
            {
                { "Travel", new[] { "Flight to Chicago", "Hotel accommodation", "Rental car", "Conference travel", "Client meeting travel" } },
                { "Meals", new[] { "Team lunch", "Client dinner", "Business breakfast", "Working lunch", "Networking dinner" } },
                { "Supplies", new[] { "Office supplies", "Printer paper", "Stationery", "Desk accessories", "Filing materials" } },
                { "Equipment", new[] { "Laptop purchase", "Monitor", "Keyboard and mouse", "Printer", "Software license" } }
            };
            
            for (int i = 1; i <= 25; i++)
            {
                var category = categories[_random.Next(categories.Length)];
                var amount = _random.NextDouble() * 4950 + 50; // $50 to $5000
                var expenseDate = DateTime.Now.AddDays(-_random.Next(1, 90));
                
                expenses.Add(new ExpenseReport
                {
                    Id = i,
                    ExpenseDate = expenseDate,
                    Category = category,
                    Amount = Math.Round((decimal)amount, 2),
                    Notes = notes[category][_random.Next(notes[category].Length)]
                });
            }
            
            return expenses;
        }
        
        public static List<Survey> GenerateSurveys()
        {
            var surveys = new List<Survey>();
            var names = new[] { "Alice Johnson", "Bob Smith", "Carol Williams", "David Brown", 
                               "Emma Davis", "Frank Miller", "Grace Wilson", "Henry Moore", 
                               "Iris Taylor", "Jack Anderson", "Kate Thomas", "Leo Jackson" };
            var locations = new[] { "New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX", 
                                   "Phoenix, AZ", "Philadelphia, PA", "San Diego, CA", "Dallas, TX" };
            var preferences = new[] { "Excellent", "Excellent", "Excellent", "Good", "Good", "Good", "Fair", "Poor" };
            
            for (int i = 1; i <= 12; i++)
            {
                surveys.Add(new Survey
                {
                    Id = i,
                    Name = names[i - 1],
                    Age = _random.Next(22, 65),
                    Location = locations[_random.Next(locations.Length)],
                    PreferenceAnswer = preferences[_random.Next(preferences.Length)],
                    CompletedDate = DateTime.Now.AddDays(-_random.Next(1, 30))
                });
            }
            
            return surveys;
        }
    }
}
