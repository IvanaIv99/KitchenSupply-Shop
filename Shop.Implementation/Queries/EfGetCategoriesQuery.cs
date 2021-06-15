using AutoMapper;
using Shop.Application.DataTransfer;
using Shop.Application.Queries;
using Shop.DataAccess;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace Shop.Implementation.Queries
{
    public class EfGetCategoriesQuery : IGetCategoriesQuery 
    {
        private readonly ShopContext _context;
        private readonly IMapper _mapper;

        public EfGetCategoriesQuery(ShopContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 4;

        public string Name => "Getting all categories";

        public IEnumerable<CategoryGetDto> Execute(CategoryPostDto search)
        {
            var categories = _context.Categories.AsQueryable();

            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                categories = categories.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }

            return _mapper.Map<IEnumerable<CategoryGetDto>>(categories);
        }
    }
}
