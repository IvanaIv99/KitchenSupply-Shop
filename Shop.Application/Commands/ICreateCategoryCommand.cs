using Shop.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Application.Commands
{
    public interface ICreateCategoryCommand : ICommand<CategoryPostDto>
    {
    }
}
