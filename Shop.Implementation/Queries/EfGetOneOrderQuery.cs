using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Shop.Application.DataTransfer;
using Shop.Application.Extensions;
using Shop.Application.Queries;
using Shop.DataAccess;
using Shop.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Shop.Implementation.Queries
{
    public class EfGetOneOrderQuery : IGetOneOrderQuery
    {
        private readonly ShopContext _context;
        private readonly IMapper _mapper;

        public EfGetOneOrderQuery(ShopContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 19;

        public string Name => "Getting one order";

        public OrderWithUserDto Execute(int search)
        {
            var orders = _context.Orders.Include(o => o.OrderLines).Include(o => o.User).AsQueryable().IgnoreQueryFilters();

            var order = orders.Where(o => o.Id == search).FirstOrDefault();
            if (order == null)
            {
                throw new EntityNotFoundException(search, typeof(Order));
            }
            return _mapper.Map<OrderWithUserDto>(order);
        }
    }
}
