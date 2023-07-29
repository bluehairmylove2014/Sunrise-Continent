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
using SunriseServer.Common.Helper;
using SunriseServerCore.Dtos.Room;
using Microsoft.Data.SqlClient;

namespace SunriseServerData.Repositories
{
    public class ReviewRepo : RepositoryBase<Review>, IReviewRepo
    {
        readonly DataContext _dataContext;
        public ReviewRepo(DataContext dbContext) : base(dbContext) 
        {
            _dataContext = dbContext;
        }

        // public override async Task<List<Review>> GetAllAsync()
        // {
            
        // }

        public async Task<List<Review>> GetHotelReviewAsync(int id)
        {
            var result = await _dataContext.Review.FromSqlInterpolated($"USP_GetHotelReviews @Id={id};").ToListAsync();
            return result;
        }
    }
}