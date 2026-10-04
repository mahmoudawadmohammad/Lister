using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Models
{
    public class TypeModel
    {
        public TypeModel()
        {
            Items = new HashSet<ItemModel>();
        }

        public int TypeId { get; set; }
        public string TypeName { get; set; }

        public virtual ICollection<ItemModel> Items { get; set; }
    }
}
