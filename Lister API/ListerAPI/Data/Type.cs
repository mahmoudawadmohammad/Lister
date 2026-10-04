using System;
using System.Collections.Generic;

#nullable disable

namespace ListerAPI.Data
{
    public partial class Type
    {
        public Type()
        {
            Items = new HashSet<Item>();
        }

        public int TypeId { get; set; }
        public string TypeName { get; set; }

        public virtual ICollection<Item> Items { get; set; }
    }
}
