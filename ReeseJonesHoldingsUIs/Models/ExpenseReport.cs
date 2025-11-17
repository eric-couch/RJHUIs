using System;

namespace ReeseJonesHoldingsUIs.Models
{
    public class ExpenseReport
    {
        public int Id { get; set; }
        public DateTime ExpenseDate { get; set; }
        public string Category { get; set; }
        public decimal Amount { get; set; }
        public string Notes { get; set; }
    }
}
