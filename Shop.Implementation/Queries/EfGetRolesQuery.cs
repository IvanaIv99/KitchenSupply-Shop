using AutoMapper;
using Shop.Application.DataTransfer;
using Shop.Application.Queries;
using Shop.Application.Searches;
using Shop.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Shop.Implementation.Queries
{
    public class EfGetRolesQuery : IGetRolesQuery
    {
        private readonly ShopContext _context;
        private readonly IMapper _mapper;


        public EfGetRolesQuery(ShopContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 10;

        public string Name => "Getting roles";

        public IEnumerable<RoleGetDto> Execute(RoleSearch search)
        {
            var query = _context.Roles.AsQueryable();
            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }

            return _mapper.Map<IEnumerable<RoleGetDto>>(query);
        }
    }
}
