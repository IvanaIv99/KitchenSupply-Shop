using Shop.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Application.Commands
{
    public interface IUpdateProductCommand : ICommand<ProductUpdateDto>
    {
    }
}
