using Shop.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Application.Searches
{
    public class UserSearch : PagedSearch
    {
        public string Value { get; set; }
    }
}
