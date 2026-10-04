using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Helpers
{
    public class ItemInfo
    {
        public int Item { get; set; }
        public double Rate { get; set; }
        public int Sold { get; set; }
        public ItemInfo(int item)
        {
            Item = item;
        }
    }
}
