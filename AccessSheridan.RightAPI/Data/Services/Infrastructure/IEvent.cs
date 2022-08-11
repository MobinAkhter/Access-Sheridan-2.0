using AccessSheridan.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccessSheridan.Data.Services.Infrastructure
{
    public interface IEvent
    {
        IEnumerable<Event> GetAll();

        IEnumerable<Event> GetAllByUser(string userId);

        Event GetByID(int id);

        void Insert(Event e);

        void Delete(int id);

        void Update(Event e);

        void Save();

        int Count();
    }
}
