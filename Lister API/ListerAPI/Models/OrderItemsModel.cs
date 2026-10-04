using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Models
{
    public class OrderItemsModel
    {
        public int OrderId { get; set; }
        public int ItemsId { get; set; }
        public byte Quantity { get; set; }
        public int UnitPrice { get; set; }
    }
}
