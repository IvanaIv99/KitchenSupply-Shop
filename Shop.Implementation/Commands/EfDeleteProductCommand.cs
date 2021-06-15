using Shop.Application.Commands;
using Shop.Application.Extensions;
using Shop.DataAccess;
using Shop.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Implementation.Commands
{
    public class EfDeleteProductCommand : IDeleteProductCommand
    {
        private readonly ShopContext _context;

        public EfDeleteProductCommand(ShopContext context)
        {
            _context = context;
        }

        public int Id => 15;

        public string Name => "Deleting product";

        public void Execute(int request)
        {
            var product = _context.Products.Find(request);
            if (product == null)
            {
                throw new EntityNotFoundException(request, typeof(Product));
            }
            product.IsDeleted = true;
            product.IsActive = false;
            product.DeletedAt = DateTime.Now;

            _context.SaveChanges();

        }
    }
}
