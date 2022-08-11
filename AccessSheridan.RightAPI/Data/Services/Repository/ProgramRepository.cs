using AccessSheridan.Data;
using AccessSheridan.Data.Models;
using AccessSheridan.Data.Services.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccessSheridan.Data.Services.Repository
{
    public class ProgramRepository : IProgram
    {
        private readonly ApplicationDbContext _db;


        public ProgramRepository(ApplicationDbContext db)
        {
            _db = db;
        }

        public int Count()
        {
            return _db.Programs.Count();
        }

        public void Delete(int id)
        {
            var product = GetByID(id);
            if (product != null)
            {
                _db.Programs.Remove(product);
            }
        }

        public IEnumerable<Programs> GetAll()
        {
            return _db.Programs.Select(x => x);
        }

        public Programs GetByID(int id)
        {
            return _db.Programs.FirstOrDefault
                    (x => x.Id == id);
        }

        public void Insert(Programs OL)
        {
            _db.Programs.Add(OL);
        }

        public void Save()
        {
            _db.SaveChanges();
        }

        public void Update(Programs p)
        {
            var _program = _db.Programs.FirstOrDefault(m => m.Id ==p.Id);
            if (_program != null)
            {
                _program.Name = p.Name;
                _program.Description = p.Description;
                _program.ModifiedBy = p.ModifiedBy;
                _program.ModifiedDate = p.ModifiedDate;
                _program.IsActive = p.IsActive;

            }
        }
    }
}
