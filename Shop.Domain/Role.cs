using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Domain
{
    public class Role : Entity
    {

        public string Name { get; set; }
        public virtual ICollection<User> Users { get; set; }
    }
}
