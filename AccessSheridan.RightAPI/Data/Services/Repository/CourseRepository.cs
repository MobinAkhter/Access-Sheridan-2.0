using AccessSheridan.Data;
using AccessSheridan.Data.Models;
using AccessSheridan.Data.Services.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace AccessSheridan.Data.Services.Repository
{
    public class CourseRepository : ICourse
    {
        private readonly ApplicationDbContext _db;


        public CourseRepository(ApplicationDbContext db)
        {
            _db = db;
        }

        public int Count()
        {
            return _db.Courses.Count();
        }

        public void Delete(int id)
        {
            var course = GetByID(id);
            if (course != null)
            {
                _db.Courses.Remove(course);
            }
        }

        public IEnumerable<Courses> GetAll()
        {
            return   _db.Courses.Include("Program").Select(x => x);
        }

        public Courses GetByID(int id)
        {
            return _db.Courses.FirstOrDefault
                    (x => x.Id == id);
        }

        public void Insert(Courses c)
        {
            _db.Courses.Add(c);
        }

        public void Save()
        {
            _db.SaveChanges();
        }

        public void Update(Courses c)
        {
            var _course = _db.Courses.FirstOrDefault(m => m.Id ==c.Id);
            if (_course != null)
            {
                _course.Name = c.Name;
                _course.Description = c.Description;
                _course.ModifiedBy = c.ModifiedBy;
                _course.ModifiedDate = c.ModifiedDate;
                _course.IsActive = c.IsActive;
            }
        }
    }
}
