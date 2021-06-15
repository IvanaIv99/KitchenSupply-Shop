using FluentValidation;
using Microsoft.EntityFrameworkCore;
using Shop.Application.Commands;
using Shop.Application.DataTransfer;
using Shop.DataAccess;
using Shop.Domain;
using Shop.Implementation.Services;
using Shop.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Shop.Implementation.Commands
{
    public class EfUpdateProductCommand : IUpdateProductCommand
    {
        private UpdateProductValidator _validator;
        private ShopContext _context;

        public EfUpdateProductCommand(UpdateProductValidator validator, ShopContext context)
        {
            _validator = validator;
            _context = context;
        }
        public int Id => 14;

        public string Name => "Updating product";

        public void Execute(ProductUpdateDto request)
        {
            if (_context.Products.Any(pr => pr.Name == request.Name))
            {

            }
            _validator.ValidateAndThrow(request);

            var product = _context.Products.AsQueryable().Include(p => p.Prices).Where(p => p.Id == request.Id).FirstOrDefault();

            var pathImage = product.ImagePath;
            if (request.Image != null)
                pathImage = UploadService.UploadImage(request.Image);

            using (var dbContextTransaction = _context.Database.BeginTransaction())
            {
                product.Name = request.Name;
                product.Description = request.Description;
                product.Stock += request.Stock;
                product.ImagePath = pathImage;
                _context.SaveChanges();
                if (!_context.PriceHistory.Where(prod => prod.ProductId == request.Id).Any(price => price.Price == request.Price))
                {
                    var price = new PriceHistory
                    {
                        Price = request.Price,
                        ProductId = request.Id
                    };
                    _context.PriceHistory.Add(price);
                    _context.SaveChanges();
                }


                dbContextTransaction.Commit();
            }
        }
    }
}
