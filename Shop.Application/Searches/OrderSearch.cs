using Shop.Application.Queries;
using Shop.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Application.Searches
{
    public class OrderSearch : PagedSearch
    {
        public string UserName { get; set; }
        public DateTime OrderDate { get; set; }
        public OrderStatus OrderStatus { get; set; }
        public PaymentOption PaymentOption { get; set; }
    }
}
