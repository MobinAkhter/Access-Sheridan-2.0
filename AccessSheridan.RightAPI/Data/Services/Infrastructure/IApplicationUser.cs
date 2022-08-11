using AccessSheridan.Data.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace AccessSheridan.Data.Services.Infrastructure
{
   public interface IApplicationUser
    {
        IEnumerable<ApplicationUser> GetAll();

        //ApplicationUser GetByID(string id);

        int Count();
    }
}
