using FluentValidation;
using Shop.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace Shop.Implementation.Validators
{
    public class CreateCategoryValidator : AbstractValidator<CategoryPostDto>
    {
        public CreateCategoryValidator()
        {
            RuleFor(c => c.Name).NotEmpty().WithMessage("Category name is required").MaximumLength(30).WithMessage("Category must have less than 30 characters.");
        }
    }
}
