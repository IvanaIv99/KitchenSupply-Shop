using Shop.Application.Commands;
using Shop.Application.Extensions;
using Shop.DataAccess;
using Shop.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Shop.Implementation.Commands
{
    public class EfDeleteRoleCommand : IDeleteRoleCommand
    {
        private readonly ShopContext _context;


        public EfDeleteRoleCommand(ShopContext context)
        {
            _context = context;

        }
        public int Id => 9;
        public string Name => "Deleting role";

        public void Execute(int request)
        {
            var role = _context.Roles.Find(request);
            if (role == null)
            {
                throw new EntityNotFoundException(request, typeof(Role));
            }
            using (var dbContextTransaction = _context.Database.BeginTransaction())
            {
                role.IsActive = false;
                role.IsDeleted = true;
                role.DeletedAt = DateTime.Now;

                _context.SaveChanges();

                var users = _context.Users.Where(u => u.RoleId == role.Id);

                foreach (var user in users)
                {
                    user.IsActive = false;
                    user.IsDeleted = true;
                    user.DeletedAt = DateTime.Now;
                }
                _context.SaveChanges();
                dbContextTransaction.Commit();
            }
        }
    }
}
