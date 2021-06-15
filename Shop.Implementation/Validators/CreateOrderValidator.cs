using FluentValidation;
using Shop.Application.DataTransfer;
using Shop.DataAccess;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace Shop.Implementation.Validators
{
    public class CreateOrderValidator : AbstractValidator<OrderDto>
    {
        private readonly ShopContext _context;

        public CreateOrderValidator(ShopContext context)
        {
            _context = context;

            RuleFor(o => o.Address).NotEmpty().WithMessage("Address is required").MaximumLength(80).WithMessage("Address must have less than 80 characters.");
            RuleFor(o => o.OrderLines).NotEmpty().WithMessage("There must be at least one product")
                 .Must(ol => ol.Select(p => p.ProductId).Distinct().Count() == ol.Count()).WithMessage("You cannot order duplicate products!")
                 .DependentRules(() =>
                 {
                     RuleForEach(x => x.OrderLines).SetValidator
                         (new CreateOrderLineValidator(_context));
                 });


        }
    }
}
