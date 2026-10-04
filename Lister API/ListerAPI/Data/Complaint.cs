using System;
using System.Collections.Generic;

#nullable disable

namespace ListerAPI.Data
{
    public partial class Complaint
    {
        public int ComplaintId { get; set; }
        public string Description { get; set; }
        public string Type { get; set; }
        public string To { get; set; }
    }
}
