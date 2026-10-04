using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Models
{
    public class RestaurantsRateModel
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
