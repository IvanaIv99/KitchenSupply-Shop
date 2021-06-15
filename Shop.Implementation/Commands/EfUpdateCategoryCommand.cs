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
    public class EfUpdateCategoryCommand : IUpdateCategoryCommand
    {
        private readonly ShopContext _context;
        private readonly UpdateCategoryValidator _validator;

        public EfUpdateCategoryCommand(ShopContext context, UpdateCategoryValidator validator)
        {
            _context = context;
            _validator = validator;
        }



        public int Id => 5;

        public string Name => "Updating category";

        public void Execute(CategoryPutDto request)
        {
            _validator.ValidateAndThrow(request);
            var category = _context.Categories.Find(request.Id);

            if (category == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Category));
            }

            category.Name = request.Name;

            _context.SaveChanges();
        }
    }
}
