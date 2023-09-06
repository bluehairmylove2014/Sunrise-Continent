

namespace SunriseServer.Services.AdminService
{
    public class HotelService : IAdminService
    {
        private readonly UnitOfWork _unitOfWork;

        public HotelService(UnitOfWork uof)
        {
            _unitOfWork = uof;
        }

        public async Task<List<YealyRevenue>> GetYealyRevenue(int? year)
        {
            return await _unitOfWork.AdminRepo.GetYealyRevenueAsync(year);
        }

        public async Task<List<WeeklyRevenue>> GetWeeklyRevenue(DateTime? date)
        {
            return await _unitOfWork.AdminRepo.GetWeeklyRevenueAsync(date);
        }
    }
}

