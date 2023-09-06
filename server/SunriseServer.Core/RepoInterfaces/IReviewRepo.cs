using SunriseServerCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunriseServerCore.RepoInterfaces
{
    public interface IReviewRepo : IRepository<Review>
    {
        Task<List<Review>> GetHotelReviewAsync(int id);
        Task<WeeklyStatistics> GetHotelWeeklyTotalReviewAsync(int hotelId, DateTime? date);
    }
}
