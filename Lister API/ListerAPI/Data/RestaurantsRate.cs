using System;
using System.Collections.Generic;

#nullable disable

namespace ListerAPI.Data
{
    public partial class RestaurantsRate
    {
        public int RestaurantId { get; set; }
        public int CustomerId { get; set; }
        public string Rate { get; set; }
        public DateTime RateDateTime { get; set; }
        public string Question1 { get; set; }
        public string Question2 { get; set; }
        public string Question3 { get; set; }
        public string Description { get; set; }
    }
}
