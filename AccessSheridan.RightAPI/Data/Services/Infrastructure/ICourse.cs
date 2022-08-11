using AccessSheridan.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccessSheridan.Data.Services.Infrastructure
{
    public interface ICourse
    {
        IEnumerable<Courses> GetAll();

        Courses GetByID(int id);

        void Insert(Courses c);

        void Delete(int id);

        void Update(Courses c);

        void Save();

        int Count();
    }
}
