using System.Text;
using SunriseServerCore.Dtos;
using SunriseServerCore.Dtos.Admin;
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

        public async Task<TotalAccountDto> GetTotalUserPartnerAsync()
        {
            var result = (await _dataContext.Set<WeeklyStatistics>()
                .FromSqlInterpolated($"EXEC USP_GetTotalUserPartner;").ToListAsync()).FirstOrDefault();

            return new TotalAccountDto {
                TotalPartner = result.ThisWeek,
                TotalUser = result.LastWeek,
            };
        }

        public async Task<List<TopPartnerDto>> GetTopPartnerAsync()
        {
            var builder = new StringBuilder($"EXEC USP_GetTopPartner;");

            Console.WriteLine(builder.ToString());
            
            var result = await _dataContext.Set<TopPartnerDto>()
                .FromSqlInterpolated($"EXECUTE({builder.ToString()})")
                .IgnoreQueryFilters().ToListAsync();

            return result;
        }
    }
}
