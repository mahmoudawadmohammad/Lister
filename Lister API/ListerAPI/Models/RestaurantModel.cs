using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Models
{
    public class RestaurantModel
    {
        public int RestaurantId { get; set; }
        public string Name { get; set; }
        public string Logo { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Type { get; set; }
        public byte TotalTables { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Activation { get; set; }
        public string Layout { get; set; }
        public string Status { get; set; }
        public int OwnerId { get; set; }
        public int CityId { get; set; }

        public virtual CityModel City { get; set; }
    }
}
