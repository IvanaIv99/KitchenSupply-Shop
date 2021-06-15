using AutoMapper;
using Shop.Application.DataTransfer;
using Shop.Application.Queries;
using Shop.Application.Searches;
using Shop.DataAccess;
using Shop.Domain;
using Shop.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Shop.Implementation.Queries
{
    public class EfGetLogsQuery : IGetLogsQuery
    {
        private readonly ShopContext _context;
        private readonly IMapper _mapper;

        public EfGetLogsQuery(ShopContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 22;

        public string Name =>"Getting logs";

        public PagedResponse<LogDto> Execute(LogSearch search)
        {
            var logs = _context.UseCaseLogs.AsQueryable();

            if (!string.IsNullOrEmpty(search.UserData) || !string.IsNullOrWhiteSpace(search.UserData))
            {
                logs = logs.Where(x => x.Actor.ToLower().Contains(search.UserData.ToLower()));
            }
            if (!string.IsNullOrEmpty(search.UseCaseName) || !string.IsNullOrWhiteSpace(search.UseCaseName))
            {
                logs = logs.Where(x => x.UseCaseName.ToLower().Contains(search.UseCaseName.ToLower()));
            }


            if (search.DateFrom != default(DateTime) || search.DateTo != default(DateTime))
            {
                if (search.DateFrom != default(DateTime) && search.DateTo == default(DateTime))
                {
                    logs = logs.Where(d => d.Date >= search.DateFrom);
                }
                if (search.DateFrom == default(DateTime) && search.DateTo != default(DateTime))
                {
                    logs = logs.Where(d => d.Date <= search.DateTo);
                }
                if (search.DateFrom != default(DateTime) && search.DateTo != default(DateTime))
                {
                    logs = logs.Where(d => d.Date >= search.DateFrom && d.Date <= search.DateTo);
                }
            }
            return logs.Paged<LogDto, UseCaseLogs>(search, _mapper);
        }
    }
}
