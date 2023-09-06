using System.Text;
using SunriseServerCore.Models;
using SunriseServerCore.RepoInterfaces;

namespace SunriseServerData.Repositories
{
    public class AdminRepo : IAdminRepo
    {
        readonly DataContext _dataContext;
        public AdminRepo(DataContext dbContext)
        {
            _dataContext = dbContext;
        }

        // mỗi phòng đc doanh thu 50k, nhân cho số phòng của booking lấy doanh thu theo tuần và theo năm
        // tổng đối tác, tổng người dùng all time

        public async Task<List<YealyRevenue>> GetYealyRevenueAsync(int? year)
        {
            var builder = new StringBuilder($"EXEC USP_CalculateAdminYearlyRevenue;");
            if (year is not null && year > 0) {
                builder.Length--;
                builder.Append($" @Year={year};");
            }

            Console.WriteLine(builder.ToString());
            
            return await _dataContext.Set<YealyRevenue>()
                .FromSqlInterpolated($"EXECUTE({builder.ToString()})").ToListAsync();
        }

        
        public async Task<List<WeeklyRevenue>> GetWeeklyRevenueAsync(DateTime? date)
        {
            var builder = new StringBuilder($"EXEC USP_CalculateAdminWeeklyRevenue;");
            if (date is not null) {
                builder.Length--;
                builder.Append($" @Date=\'{date?.ToString("MM-dd-yyyy")}\';");
            }

            Console.WriteLine(builder.ToString());
            
            var result = await _dataContext.Set<WeeklyRevenue>()
                .FromSqlInterpolated($"EXECUTE({builder.ToString()})").ToListAsync();

            return result;
        }
    }
}
