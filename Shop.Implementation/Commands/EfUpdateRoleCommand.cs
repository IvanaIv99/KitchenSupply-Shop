using FluentValidation;
using Shop.Application.Commands;
using Shop.Application.DataTransfer;
using Shop.Application.Extensions;
using Shop.DataAccess;
using Shop.Domain;
using Shop.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Implementation.Commands
{
    public class EfUpdateRoleCommand : IUpdateRoleCommand
    {
        private readonly ShopContext _context;
        private readonly UpdateRoleValidator _validator;

        public EfUpdateRoleCommand(ShopContext context, UpdateRoleValidator validator)
        {
            _context = context;
            _validator = validator;
        }
        public int Id => 8;

        public string Name => "Updating role";

        public void Execute(RolePutDto request)
        {
            _validator.ValidateAndThrow(request);

            var role = _context.Roles.Find(request.Id);

            if (role == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Role));
            }

            role.Name = request.Name;
            _context.SaveChanges();
        }
    }
}
