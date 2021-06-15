using Shop.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Application.Queries
{
    public interface IGetOneProductPictureQuery : IQuery<int, IEnumerable<ProductPictureDto>>
    {
    }
}
