using Shop.Application.DataTransfer;
using Shop.Application.Queries;
using Shop.Application.Searches;
using Shop.DataAccess;
using Shop.Domain;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using Shop.Implementation.Extensions;
using AutoMapper;
using Microsoft.EntityFrameworkCore;

namespace Shop.Implementation.Queries
{
    public class EfGetProductsQuery : IGetProductsQuery
    {
        private readonly ShopContext _context;
        private readonly IMapper _mapper;

        public EfGetProductsQuery(ShopContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 16;

        public string Name => "Getting products";

        public PagedResponse<ProductSearchDto> Execute(ProductSearch search)
        {
        
            var query = _context.Products.Include(pr => pr.Prices).AsQueryable();

            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()) || x.Description.ToLower().Contains(search.Name.ToLower()));
            }
            if (search.CategoryId != 0)
            {
                if (_context.Categories.Any(c => c.Id == search.CategoryId))
                {
                    query = query.Where(p => p.CategoryId == search.CategoryId);
                }
                else
                {
                    query = query.Take(0);
                }
            }
            if (search.Stock)
            {
                query = query.Where(p => p.Stock > 0);
            }


            



            return query.Paged<ProductSearchDto, Product>(search, _mapper);

        }
    }
}
