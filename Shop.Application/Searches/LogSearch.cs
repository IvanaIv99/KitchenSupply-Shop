using Shop.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Application.Searches
{
    public class LogSearch : PagedSearch
    {
        public string UserData { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime DateTo { get; set; }
        public string UseCaseName { get; set; }
    }
}
