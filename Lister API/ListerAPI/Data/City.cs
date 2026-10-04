using System;
using System.Collections.Generic;

#nullable disable

namespace ListerAPI.Data
{
    public partial class City
    {
        public City()
        {
            //Admins = new HashSet<Admin>();
            //Customers = new HashSet<Customer>();
            //DeliveryMen = new HashSet<DeliveryMan>();
            //Owners = new HashSet<Owner>();
            //Restaurants = new HashSet<Restaurant>();
        }

        public int CityId { get; set; }
        public string Name { get; set; }

        //public virtual ICollection<Admin> Admins { get; set; }
        //public virtual ICollection<Customer> Customers { get; set; }
        //public virtual ICollection<DeliveryMan> DeliveryMen { get; set; }
        //public virtual ICollection<Owner> Owners { get; set; }
        //public virtual ICollection<Restaurant> Restaurants { get; set; }
    }
}
