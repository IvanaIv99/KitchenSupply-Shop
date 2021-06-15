using Shop.Application.Commands;
using Shop.Application.DataTransfer;
using Shop.DataAccess;
using Shop.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;
using FluentValidation;
using Shop.Domain;

namespace Shop.Implementation.Commands
{
    public class EfCreateCategoryCommand : ICreateCategoryCommand
    {
        private readonly ShopContext _context;
        private readonly CreateCategoryValidator _validator;

        public EfCreateCategoryCommand(ShopContext context, CreateCategoryValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 3;

        public string Name => "Creating new Category";

        public void Execute(CategoryPostDto request)
        {
            _validator.ValidateAndThrow(request);

            var category = new Category
            {
                Name = request.Name
            };
            _context.Categories.Add(category);
            _context.SaveChanges();

        }
    }
}
