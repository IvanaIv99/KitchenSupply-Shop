using Shop.Application.Commands;
using Shop.Application.DataTransfer;
using Shop.DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Implementation.Commands
{
    public class EfDeleteProductPictureCommand : IDeleteProductPictureCommand
    {
        private readonly ShopContext _context;

        public EfDeleteProductPictureCommand(ShopContext context)
        {
            _context = context;
        }
        public int Id => 12;

        public string Name => "Deleting one product pictures";

        public void Execute(IEnumerable<ProductPictureDeleteDto> request)
        {
            var query = _context.Pictures;
            foreach (var item in request)
            {
                var productPicture = query.Find(item.IdPicture);
                _context.Pictures.Remove(productPicture);
            }
            _context.SaveChanges();
        }
    }
}
