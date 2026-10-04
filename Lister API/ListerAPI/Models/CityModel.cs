using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Models
{
    public class CityModel
    {
        public CityModel()
        {
            Admins = new HashSet<AdminModel>();
            Customers = new HashSet<CustomerModel>();
            DeliveryMen = new HashSet<DeliveryManModel>();
            Owners = new HashSet<OwnerModel>();
            Restaurants = new HashSet<RestaurantModel>();
        }

        public int CityId { get; set; }
        public string Name { get; set; }

        public virtual ICollection<AdminModel> Admins { get; set; }
        public virtual ICollection<CustomerModel> Customers { get; set; }
        public virtual ICollection<DeliveryManModel> DeliveryMen { get; set; }
        public virtual ICollection<OwnerModel> Owners { get; set; }
        public virtual ICollection<RestaurantModel> Restaurants { get; set; }
    }
}
