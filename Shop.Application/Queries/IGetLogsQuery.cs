using Shop.Application.DataTransfer;
using Shop.Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Application.Queries
{
    public interface IGetLogsQuery :  IQuery<LogSearch, PagedResponse<LogDto>>
    {
    }
}
