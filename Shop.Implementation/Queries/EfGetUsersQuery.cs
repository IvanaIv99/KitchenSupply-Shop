using AutoMapper;
using Shop.Application.DataTransfer;
using Shop.Application.Queries;
using Shop.Application.Searches;
using Shop.DataAccess;
using Shop.Domain;
using Shop.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Shop.Implementation.Queries
{
    public class EfGetUsersQuery : IGetUsersQuery
    {
        private readonly ShopContext _context;
        private readonly IMapper _mapper;


        public EfGetUsersQuery(ShopContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 23;

        public string Name => "Getting all users by search";

        public PagedResponse<UserGetDto> Execute(UserSearch search)
        {
            var query = _context.Users.AsQueryable();
            if (!string.IsNullOrEmpty(search.Value) || !string.IsNullOrWhiteSpace(search.Value))
            {
                query = query.Where(x => x.FirstName.ToLower().Contains(search.Value.ToLower()) || x.LastName.ToLower().Contains(search.Value.ToLower()) || x.Email.ToLower().Contains(search.Value.ToLower()) );
            }

            return query.Paged<UserGetDto, User>(search, _mapper);
        }
    }
}
