using System;
using System.Collections.Generic;

#nullable disable

namespace ListerAPI.Data
{
    public partial class Reservation
    {
        public int ReservationId { get; set; }
        public DateTime DateTime { get; set; }
        public DateTime? EdateTime { get; set; }
        public byte PersonesNumber { get; set; }
        public string TablesNumber { get; set; }
        public string Status { get; set; }
        public string Comments { get; set; }
        public int CustomerId { get; set; }
        public int RestaurantId { get; set; }
    }
}
