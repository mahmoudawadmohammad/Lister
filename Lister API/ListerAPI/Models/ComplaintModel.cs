using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Models
{
    public class ComplaintModel
    {
        public int ComplaintId { get; set; }
        public string Description { get; set; }
        public string Type { get; set; }
        public string To { get; set; }
    }
}
