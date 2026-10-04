using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Models
{
    public class SearchData
    {
        public List<RestaurantModel> Restaurants { get; set; }
        public List<ItemModel> Items { get; set; }
    }
}
