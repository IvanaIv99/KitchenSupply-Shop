using Shop.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Application.Queries
{
   public interface IGetOneUserQuery : IQuery<int, UserGetDto>
    {
    }
}
