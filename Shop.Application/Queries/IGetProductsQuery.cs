using Shop.Application.DataTransfer;
using Shop.Application.Searches;
using Shop.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Application.Queries
{
    public interface IGetProductsQuery : IQuery<ProductSearch, PagedResponse<ProductSearchDto>>
    {
    }
}
