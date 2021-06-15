using FluentValidation;
using Shop.Application.Commands;
using Shop.Application.DataTransfer;
using Shop.DataAccess;
using Shop.Domain;
using Shop.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Implementation.Commands
{
    public class EfCreateRoleCommand : ICreateRoleCommand
    {
        private readonly ShopContext _context;
        private readonly CreateRoleValidator _validator;

        public EfCreateRoleCommand(ShopContext context, CreateRoleValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 6;

        public string Name => "Creating new role";

        public void Execute(RolePostDto request)
        {
            _validator.ValidateAndThrow(request);

            var role = new Role
            {
                Name = request.Name
            };

            _context.Roles.Add(role);
            _context.SaveChanges();
        }
    }
}
