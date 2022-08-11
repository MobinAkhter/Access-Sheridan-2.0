using AccessSheridan.Data.Models.DTOs.Tokens;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccessSheridan.RightAPI.Data.Models.DTOs.Tokens
{
    public interface IRefreshToken
    {
        IEnumerable<RefreshToken> GetAll();

        RefreshToken GetByID(int id);

        void Insert(RefreshToken catItem);

        void Delete(int id);

        void Save();

        int Count();
        void Update(RefreshToken storedToken);
    }
}
