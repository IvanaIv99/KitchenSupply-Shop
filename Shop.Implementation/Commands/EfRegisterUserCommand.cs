using FluentValidation;
using Shop.Application.Commands;
using Shop.Application.DataTransfer;
using Shop.Application.Email;
using Shop.DataAccess;
using Shop.Domain;
using Shop.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Implementation.Commands
{
    public class EfRegisterUserCommand : IRegisterUserCommand
    {
        private readonly ShopContext _context;
        private readonly RegisterUserValidator _validator;
        private readonly IEmailSender _sender;

        public EfRegisterUserCommand(ShopContext context, RegisterUserValidator validator, IEmailSender sender)
        {
            _context = context;
            _validator = validator;
            _sender = sender;
        }

        public int Id => 2;

        public string Name => "User registration" ;

        public void Execute(UserPostDto request)
        {
            _validator.ValidateAndThrow(request);


                using (var dbContextTransaction = _context.Database.BeginTransaction())
                {
                    var user = new User
                    {
                        FirstName = request.FirstName,
                        LastName = request.LastName,
                        Email = request.Email,
                        Pass = request.Pass,
                        RoleId = 1
                    };

                    _context.Users.Add(user);
                    _context.SaveChanges();

                    var authUseCases = new List<int> { 20,25,4,17,16,26 };
                    foreach (var useCase in authUseCases)
                    {
                        var useCaseRow = new UserUseCase
                        {
                            UserId = user.Id,
                            UseCaseId = useCase
                        };
                        _context.UserUseCases.Add(useCaseRow);
                    }
                    _context.SaveChanges();
                    dbContextTransaction.Commit();
                }

                _sender.Send(new SendEmailDto
                {
                    Content = "<h1>Successfully registration!</h1>",
                    SendTo = request.Email,
                    Subject = "KitchenSupplyShop registration"
                });
        }
    }
}
