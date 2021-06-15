using FluentValidation;
using Shop.Application.Commands;
using Shop.Application.DataTransfer;
using Shop.DataAccess;
using Shop.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Implementation.Commands
{
    public class EfUpdateUserCommand : IUpdateUserCommand
    {
        private readonly ShopContext _context;
        private readonly UpdateUserValidator _validator;

        public EfUpdateUserCommand(ShopContext context, UpdateUserValidator validator)
        {
            _context = context;
            _validator = validator;
        }
        public int Id => 25;

        public string Name => "Updating user info";

        public void Execute(UserPutDto request)
        {
            _validator.ValidateAndThrow(request);
            var user = _context.Users.Find(request.Id);

            user.FirstName = request.FirstName;
            user.LastName = request.LastName;
            user.Email = request.Email;

            _context.SaveChanges();
        }
    }
}
