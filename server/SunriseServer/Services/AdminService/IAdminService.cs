using SunriseServerCore.Dtos.Admin;

namespace SunriseServer.Services.AdminService
{
    public interface IAdminService
    {
        Task<List<YealyRevenue>> GetYealyRevenue(int? year);
        Task<List<WeeklyRevenue>> GetWeeklyRevenue(DateTime? date);
        Task<TotalAccountDto> GetTotalUserPartner();
        Task<List<TopPartnerDto>> GetTopPartner();
    }
};

