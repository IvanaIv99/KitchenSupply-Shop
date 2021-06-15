using FluentValidation;
using Shop.Application.DataTransfer;
using Shop.DataAccess;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace Shop.Implementation.Validators
{
    public class CreateRoleValidator : AbstractValidator<RolePostDto>
    {
        public CreateRoleValidator(ShopContext context)
        {
            RuleFor(x => x.Name).NotEmpty().Must(name => !context.Roles.Any(r => r.Name == name)).WithMessage("Role name already exist");
        }
    }
}
