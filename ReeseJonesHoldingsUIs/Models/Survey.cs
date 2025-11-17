using System;

namespace ReeseJonesHoldingsUIs.Models
{
    public class Survey
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Age { get; set; }
        public string Location { get; set; }
        public string PreferenceAnswer { get; set; }
        public DateTime CompletedDate { get; set; }
    }
}
