using Shop.Application.Commands;
using Shop.Application.DataTransfer;
using Shop.DataAccess;
using Shop.Domain;
using Shop.Implementation.Services;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Implementation.Commands
{
    public class EfCreateProductPictureCommand : ICreateProductPictureCommand
    {
        private readonly ShopContext _context;

        public EfCreateProductPictureCommand(ShopContext context)
        {
            _context = context;
        }
        public int Id => 11;

        public string Name => "Inserting new product pictures";

        public void Execute(NewProductPictureDto request)
        {
            var paths = UploadService.UploadImages(request.Pictures);

            for (int i = 0; i < paths.Count; i++)
            {
                var productPicture = new Picture
                {
                    ImagePath = paths[i],
                    ProductId = request.ProductId
                };
                _context.Pictures.Add(productPicture);

            }
            _context.SaveChanges();
        }
    }
}
