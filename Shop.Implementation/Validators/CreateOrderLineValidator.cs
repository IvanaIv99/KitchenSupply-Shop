using FluentValidation;
using Shop.Application.DataTransfer;
using Shop.DataAccess;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace Shop.Implementation.Validators
{
    public class CreateOrderLineValidator : AbstractValidator<OrderLineDto>
    {
        private readonly ShopContext  _context;
        public CreateOrderLineValidator(ShopContext context)
        {
            _context = context;


            RuleFor(x => x.ProductId)
                .Must(ProductExists)
                .WithMessage("Product with an id of {PropertyValue} doesn't exist.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Quantity)
                    .GreaterThan(0)
                    .WithMessage("Quantity must be greater than 0")
                    .Must(QuantityDoesentExeedProductQuantity)
                    .WithMessage("Defined quantity {PropertyValue} is unavailable.");
                });
        }

        private bool ProductExists(int productId)
        {
            return _context.Products.Any(x => x.Id == productId);
        }

        private bool QuantityDoesentExeedProductQuantity(OrderLineDto dto, int quantity)
        {
            return _context.Products.Find(dto.ProductId).Stock >= quantity;
        }
    }
}
