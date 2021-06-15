using FluentValidation;
using Shop.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Implementation.Validators
{
    public class CreateProductValidator : AbstractValidator<ProductDto>
    {
        public CreateProductValidator()
        {
            RuleFor(x => x.Name).NotEmpty().WithMessage("Product name is required").MaximumLength(80).WithMessage("Product must have less than 80 characters.");
            RuleFor(x => x.Description).NotEmpty().WithMessage("Description is required").MaximumLength(500).WithMessage("Product must have less than 500 characters.");
            RuleFor(x => x.Stock).NotEmpty().WithMessage("Stock is required");
            RuleFor(x => x.Price).NotEmpty().WithMessage("Price is required");

        }
    }
}
