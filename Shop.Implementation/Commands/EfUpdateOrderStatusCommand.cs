using Microsoft.EntityFrameworkCore;
using Shop.Application.Commands;
using Shop.Application.DataTransfer;
using Shop.Application.Exceptions;
using Shop.Application.Extensions;
using Shop.DataAccess;
using Shop.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Shop.Implementation.Commands
{
    public class EfUpdateOrderStatusCommand : IUpdateOrderStatusCommand
    {
        private readonly ShopContext _context;

        public EfUpdateOrderStatusCommand(ShopContext context)
        {
            _context = context;
        }
        public int Id => 21;

        public string Name => "Changing order status";

        public void Execute(ChangeOrderStatusDto request)
        {
            var order = _context.Orders.AsQueryable().Include(o => o.OrderLines).ThenInclude(order => order.Product).FirstOrDefault(o => o.Id == request.OrderId);


            if (order == null)
            {
                throw new EntityNotFoundException(request.OrderId, typeof(Order));
            }

            if (order.OrderStatus == OrderStatus.Delivered)
            {
                throw new ConflictOrderStatusException("Cannot change status of delivered order!");
            }

            if (order.OrderStatus == OrderStatus.OnHold)
            {
                if (request.Status == OrderStatus.Delivered)
                {
                    throw new ConflictOrderStatusException("Order cannot be changed from recieved to delivered directly!");
                }
            }

            if (request.Status == OrderStatus.Canceled || request.Status == OrderStatus.Shipped)
            {
                order.OrderStatus = request.Status;
                if (request.Status == OrderStatus.Canceled)
                {

                    foreach (var item in order.OrderLines)
                    {

                        item.Product.Stock += item.Quantity;
                    }
                }
                _context.SaveChanges();

            }
        }
    }
}
