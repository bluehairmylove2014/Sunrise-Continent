using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using SunriseServerData;
using SunriseServerCore.Models;
using SunriseServerCore.RepoInterfaces;

namespace SunriseServerData.Repositories
{
    public class HotelRepo : RepositoryBase<Hotel>, IHotelRepo
    {
        readonly DataContext _dataContext;
        public HotelRepo(DataContext dbContext) : base(dbContext) 
        {
            _dataContext = dbContext;
        }

        public override async Task<IEnumerable<Hotel>> GetAllAsync()
        {
            var result = await _dataContext.Hotels.FromSqlInterpolated($"USP_GetAllHotel").ToListAsync();
            return result;
        }

        public override async Task<Hotel> GetByIdAsync(int id)
        {
            var result = await _dataContext.Hotels.FromSqlInterpolated($"USP_GetHotelById @Id = {id}").ToListAsync();
            return result.FirstOrDefault();
        }
    }
}
