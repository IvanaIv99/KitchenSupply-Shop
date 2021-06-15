using FluentValidation;
using Shop.Application.Commands;
using Shop.Application.DataTransfer;
using Shop.DataAccess;
using Shop.Domain;
using Shop.Implementation.Services;
using Shop.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;


namespace Shop.Implementation.Command
{
    public class EfCreateProductCommand : ICreateProductCommand
    {
        private readonly ShopContext _context;
        private CreateProductValidator _validator;

        public EfCreateProductCommand(CreateProductValidator validator, ShopContext context)
        {
            _validator = validator;
            _context = context;
        }
        public int Id => 1;
        public string Name => "Create new Product";

        public void Execute(ProductDto request)
        {
            _validator.ValidateAndThrow(request);
            var paths = UploadService.UploadImages(request.Images);
            var product = new Product
            {
                Name = request.Name,
                Description = request.Description,
                Stock = request.Stock,
                ImagePath = paths[0],
                CategoryId = request.CategoryId

            };

            using (var dbContextTransaction = _context.Database.BeginTransaction())
            {
                _context.Products.Add(product);
                _context.SaveChanges();
                int LastProductId = product.Id;
                for (int i = 1; i < paths.Count; i++)
                {
                    var productPicture = new Picture
                    {
                        ImagePath = paths[i],
                        ProductId = LastProductId
                    };
                    _context.Pictures.Add(productPicture);
                }
                _context.SaveChanges();

                var price = new PriceHistory
                {
                    Price = request.Price,
                    ProductId = LastProductId
                };
                _context.PriceHistory.Add(price);
                _context.SaveChanges();
                dbContextTransaction.Commit();
            }
        }
    }
}
