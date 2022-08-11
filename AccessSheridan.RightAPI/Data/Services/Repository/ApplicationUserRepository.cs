using AccessSheridan.Data.Models;
using AccessSheridan.Data.Services.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AccessSheridan.Data.Services.Repository
{
    public class ApplicationUserRepository : IApplicationUser
    {
        private readonly ApplicationDbContext _db;


        public ApplicationUserRepository(ApplicationDbContext db)
        {
            _db = db;
        }

        public int Count()
        {
            return _db.User.Count();
        }

        public IEnumerable<ApplicationUser> GetAll()
        {
            return _db.User.ToList();
        }

        public ApplicationUser GetByID(string id)
        {
            throw new NotImplementedException();
        }
    }
}
