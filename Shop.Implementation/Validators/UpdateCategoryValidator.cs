using FluentValidation;
using Shop.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Implementation.Validators
{
    public class UpdateCategoryValidator : AbstractValidator<CategoryPutDto>
    {
        public UpdateCategoryValidator()
        {
            RuleFor(c => c.Name).NotEmpty().WithMessage("Category name is required").MaximumLength(30).WithMessage("Category must have less than 30 characters.");
        }
    }
}
