using System;
using System.Collections.Generic;

#nullable disable

namespace ListerAPI.Data
{
    public partial class Customer
    {
        public int CustomerId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime BirthDate { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Image { get; set; }
        public string Status { get; set; }
        public int CityId { get; set; }

        public virtual City City { get; set; }
    }
}
