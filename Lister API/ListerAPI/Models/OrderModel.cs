using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Models
{
    public class OrderModel
    {
        public int OrderId { get; set; }
        public DateTime DateTime { get; set; }
        public string Status { get; set; }
        public TimeSpan ExpectedTime { get; set; }
        public string Comments { get; set; }
        public int CustomerId { get; set; }
        public int RestaurantId { get; set; }
        public int DeliveryManId { get; set; }
        public int? DiscountId { get; set; }
    }
}
