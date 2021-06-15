using FluentValidation;
using Shop.Application.DataTransfer;
using Shop.DataAccess;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace Shop.Implementation.Validators
{
    public class UpdateProductValidator : AbstractValidator<ProductUpdateDto>
    {
        private readonly ShopContext _context;

        public UpdateProductValidator(ShopContext context)
        {
            _context = context;

            RuleFor(x => x.Name).NotEmpty().WithMessage("Product name is required")
                .Must(n => _context.Products.Where(pr => pr.Name != n).All(p => p.Name != n)).WithMessage("Name already exist in database!")
                .MaximumLength(80).WithMessage("Product must have less than 80 characters.");
            RuleFor(c => c.Description).NotEmpty().WithMessage("Description is required").MaximumLength(500).WithMessage("Product must have less than 500 characters.");
            RuleFor(c => c.Stock).NotEmpty().WithMessage("Stock is required");
            RuleFor(c => c.Price).NotEmpty().WithMessage("Price is required").GreaterThan(0).WithMessage("Price must be greater than 0!");
        }
    }
}
