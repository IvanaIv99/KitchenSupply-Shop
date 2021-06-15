using FluentValidation;
using Shop.Application.DataTransfer;
using Shop.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Shop.Implementation.Validators
{
    public class RegisterUserValidator : AbstractValidator<UserPostDto>
    {
        public RegisterUserValidator(ShopContext context)
        {
            RuleFor(x => x.FirstName).NotEmpty().WithMessage("First name is required").MaximumLength(25).WithMessage("First name must be less than 25 characters");
            RuleFor(x => x.LastName).NotEmpty().WithMessage("Last name is required").MaximumLength(25).WithMessage("Last name must be least 25 characters");
            
            RuleFor(x => x.Pass).NotEmpty().WithMessage("Password is required").MaximumLength(25).WithMessage("Password must have less than 25 characters");
            RuleFor(x => x.Email).NotEmpty().WithMessage("Email is required").EmailAddress().WithMessage("Email must be in valid format")
                .Must(x => !context.Users.Any(user => user.Email == x)).WithMessage("Email is already taken");

        }
    }
}
