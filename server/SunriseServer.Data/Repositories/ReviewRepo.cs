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

        public async Task<List<Review>> GetHotelReviewAsync(int id)
        {
            var result = await _dataContext.Review.FromSqlInterpolated($"USP_GetHotelReviews @Id={id};").ToListAsync();
            return result;
        }

        public async Task<WeeklyStatistics> GetHotelWeeklyTotalReviewAsync(int hotelId, DateTime? date)
        {
            var builder = new StringBuilder($"EXEC USP_GetWeeklyReview @HotelId={hotelId};");
            if (date is not null) {
                builder.Length--;
                builder.Append($", @Date=\'{date?.ToString("MM-dd-yyyy")}\';");
            }

            Console.WriteLine(builder.ToString());
            
            var result = (await _dataContext.Set<WeeklyStatistics>()
                .FromSqlInterpolated($"EXECUTE({builder.ToString()})").ToListAsync()).FirstOrDefault();

            return result;
        }
    }
}