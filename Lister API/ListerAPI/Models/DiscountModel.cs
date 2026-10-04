using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Models
{
    public class DiscountModel
    {
        public int DiscountId { get; set; }
        public int NumberOfOrders { get; set; }
        public double RequerdPrice { get; set; }
        public double Percentage { get; set; }
        public string Image { get; set; }
        public DateTime Start { get; set; }
        public DateTime End { get; set; }
        public string Description { get; set; }
        public string SimplifiedExplanation { get; set; }
        public int RestaurantId { get; set; }
    }
}
