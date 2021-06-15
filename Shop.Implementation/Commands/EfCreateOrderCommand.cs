using AutoMapper;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using Shop.Application;
using Shop.Application.Commands;
using Shop.Application.DataTransfer;
using Shop.DataAccess;
using Shop.Domain;
using Shop.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Shop.Implementation.Commands
{
    public class EfCreateOrderCommand : ICreateOrderCommand
    {
        private readonly ShopContext _context;
        private readonly CreateOrderValidator _validator;
        private readonly IApplicationActor _actor;
        private readonly IMapper _mapper;

        public EfCreateOrderCommand(ShopContext context, CreateOrderValidator validator, IApplicationActor actor, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _actor = actor;
            _mapper = mapper;
        }

        public int Id => 20;

        public string Name => "Creating order";

        public void Execute(OrderDto request)
        {
            _validator.ValidateAndThrow(request);

            var userId = _actor.Id;
            using (var dbContextTransaction = _context.Database.BeginTransaction())
            {
                var order = new Order
                {
                    Address = request.Address,
                    UserId = userId,
                    OrderStatus = OrderStatus.OnHold,
                    PaymentOption = request.PaymentOption
                };
                _context.Orders.Add(order);
                _context.SaveChanges();
                foreach (var line in request.OrderLines)
                {
                    var product = _context.Products.Include(p => p.Prices).Where(p => p.Id == line.ProductId).FirstOrDefault();
                    var orderLine = new OrderLine
                    {
                        Name = product.Name,
                        Price = product.Prices.OrderByDescending(date => date.CreatedAt).FirstOrDefault().Price,
                        OrderId = order.Id,
                        ProductId = product.Id,
                        Quantity = line.Quantity
                    };
                    product.Stock -= line.Quantity;
                    _context.OrderLines.Add(orderLine);
                }

                _context.SaveChanges();
                dbContextTransaction.Commit();
            }
        }
    }
}
