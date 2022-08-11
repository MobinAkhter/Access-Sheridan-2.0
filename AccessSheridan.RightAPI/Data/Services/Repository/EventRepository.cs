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
    public class EventRepository : IEvent
    {
        private readonly ApplicationDbContext _db;


        public EventRepository(ApplicationDbContext db)
        {
            _db = db;
        }

        public int Count()
        {
            return _db.Event.Count();
        }

        public void Delete(int id)
        {
            var Event = GetByID(id);
            if ( Event!= null)
            {
                _db.Event.Remove(Event);
            }
        }

        public IEnumerable<Event> GetAll()
        {
            return   _db.Event.Include("User").Include("Program").Include("Course").Select(x => x);
        }

        public IEnumerable<Event> GetAllByUser(string userId)
        {
            return _db.Event.Include("User").Include("Program").Include("Course").Where(w => w.UserId ==userId).Select(x => x);
        }

        public Event GetByID(int id)
        {
            return _db.Event.FirstOrDefault
                    (x => x.EventID == id);
        }

        public void Insert(Event e)
        {
            _db.Event.Add(e);
        }

        public void Save()
        {
            _db.SaveChanges();
        }

        public void Update(Event e)
        {
            var _event = _db.Event.FirstOrDefault(m => m.EventID ==e.EventID);
            if (_event != null)
            {
                _event.Subject = e.Subject;
                _event.Description = e.Description;
                _event.ProgramsId = e.ProgramsId;
                _event.CoursesId = e.CoursesId;
            }
        }
    }
}
