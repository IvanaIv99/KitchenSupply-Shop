using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Domain
{
    public class Picture : Entity
    {
        public string ImagePath { get; set; }
        public virtual Product Product { get; set; }
        public int ProductId { get; set; }
    }
}
