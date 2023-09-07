using SunriseServerCore.Dtos.Booking;

namespace SunriseServer.Services.AdminService
{
    public interface IAdminService
    {
        Task<List<YealyRevenue>> GetYealyRevenue(int? year);
        Task<List<WeeklyRevenue>> GetWeeklyRevenue(DateTime? date);
    }
};

