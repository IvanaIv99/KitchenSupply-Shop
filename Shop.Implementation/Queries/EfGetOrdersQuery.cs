using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Shop.Application;
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
    public class EfGetOrdersQuery : IGetOrdersQuery
    {
        private readonly ShopContext _context;
        private readonly IApplicationActor _actor;
        private readonly IMapper _mapper;

        public EfGetOrdersQuery(ShopContext context, IApplicationActor actor, IMapper mapper)
        {
            _context = context;
            _actor = actor;
            _mapper = mapper;
        }

        public int Id => 18;

        public string Name => "Getting all orders";

        public PagedResponse<OrderWithUserDto> Execute(OrderSearch search)
        {
            var query = _context.Orders.AsQueryable();
            query = query.Include(o => o.OrderLines).Include(o => o.User);

            if (search.OrderDate != default(DateTime))
            {
                query = query.Where(o => o.CreatedAt.Date == search.OrderDate);
            }

            return query.Paged<OrderWithUserDto, Order>(search, _mapper);

        }
    }
}
