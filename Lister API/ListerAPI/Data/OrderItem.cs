using System;
using System.Collections.Generic;

#nullable disable

namespace ListerAPI.Data
{
    public partial class OrderItem
    {
        public int OrderId { get; set; }
        public int ItemsId { get; set; }
        public byte Quantity { get; set; }
        public int UnitPrice { get; set; }
    }
}
