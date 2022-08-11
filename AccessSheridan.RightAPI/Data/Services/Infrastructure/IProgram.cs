using AccessSheridan.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccessSheridan.Data.Services.Infrastructure
{
    public interface IProgram
    {
        IEnumerable<Programs> GetAll();

        Programs GetByID(int id);

        void Insert(Programs P);

        void Delete(int id);

        void Update(Programs P);

        void Save();

        int Count();
    }
}
