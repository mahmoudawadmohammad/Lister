using System;
using System.Collections.Generic;

#nullable disable

namespace ListerAPI.Data
{
    public partial class Item
    {
        public int ItemsId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int Price { get; set; }
        public string Photo { get; set; }
        public byte PreparingTime { get; set; }
        public string Status { get; set; }
        public int TypeId { get; set; }
        public int RestaurantId { get; set; }

        public virtual Type Type { get; set; }
    }
}
