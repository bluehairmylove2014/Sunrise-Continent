using SunriseServerCore.Dtos.Admin;
using SunriseServerCore.Models;

namespace SunriseServerCore.RepoInterfaces
{
    public interface IAdminRepo
    {
        Task<List<YealyRevenue>> GetYealyRevenueAsync(int? year);
        Task<List<WeeklyRevenue>> GetWeeklyRevenueAsync(DateTime? date);
        Task<TotalAccountDto> GetTotalUserPartnerAsync();
        Task<List<TopPartnerDto>> GetTopPartnerAsync();
    }
}
