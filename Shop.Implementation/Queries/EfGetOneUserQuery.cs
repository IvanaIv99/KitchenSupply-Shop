using AutoMapper;
using Shop.Application.DataTransfer;
using Shop.Application.Extensions;
using Shop.Application.Queries;
using Shop.DataAccess;
using Shop.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Implementation.Queries
{
    public class EfGetOneUserQuery : IGetOneUserQuery
    {
        private readonly ShopContext _context;
        private readonly IMapper _mapper;

        public EfGetOneUserQuery(ShopContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 24;

        public string Name => "Getting one user info";

        public UserGetDto Execute(int search)
        {
            var user = _context.Users.Find(search);
            if (user == null)
            {
                throw new EntityNotFoundException(search, typeof(User));
            }
            return _mapper.Map<UserGetDto>(user);

        }
    }
}
