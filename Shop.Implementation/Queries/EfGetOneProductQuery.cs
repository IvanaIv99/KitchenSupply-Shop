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
    public class EfGetOneProductQuery : IGetOneProductQuery
    {
        private readonly ShopContext _context;
        private readonly IMapper _mapper;

        public EfGetOneProductQuery(ShopContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 17;

        public string Name => "Getting one product";

        public ProductSearchDto Execute(int search)
        {
            var query = _context.Products.AsQueryable();
            query = query.Include(p => p.Pictures).Include(pr => pr.Prices).Where(p => p.Id == search);

            if (query.Count() == 0)
            {
                throw new EntityNotFoundException(search, typeof(Product));
            }
            var product = query.Select(x => new ProductSearchDto
            {
                Id = x.Id,
                Name = x.Name,
                Description = x.Description,
                Stock = x.Stock,
                ImagePath = x.ImagePath,
                Pictures = x.Pictures.Where(pic => x.Id == pic.ProductId).Select(p => new PictureDto
                {
                    Id = p.Id,
                    Path = p.ImagePath
              
                    
                }),
                CategoryId = x.CategoryId,
                Prices = x.Prices.Where(p => p.ProductId == x.Id).Select(p => new PriceSearchDto
                {
                    Id = p.Id,
                    Price = p.Price,
                    ProductId = p.ProductId,
                    CreatedAt = p.CreatedAt
                }).OrderByDescending(date => date.CreatedAt).Take(2)
            }).First();

            //return _mapper.Map<ProductSearchDto>(product);
            return product;


        }
    }
}
