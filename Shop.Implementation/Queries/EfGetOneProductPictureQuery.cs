using AutoMapper;
using Shop.Application.DataTransfer;
using Shop.Application.Queries;
using Shop.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Shop.Implementation.Queries
{
    public class EfGetOneProductPictureQuery : IGetOneProductPictureQuery
    {
        private readonly ShopContext _context;
        private readonly IMapper _mapper;

        public EfGetOneProductPictureQuery(ShopContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 13;

        public string Name => "Getting one product pictures";

        public IEnumerable<ProductPictureDto> Execute(int search)
        {
            var query = _context.Pictures.Where(p => p.ProductId == search);

            return _mapper.Map<IEnumerable<ProductPictureDto>>(query);
        }
    }
}
