using Shop.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Application.Searches
{
    public class RoleSearch : PagedSearch
    {
        public string Name { get; set; }
    }
}
