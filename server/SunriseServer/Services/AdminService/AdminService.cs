using SunriseServerCore.Dtos.Admin;

namespace SunriseServer.Services.AdminService
{
    public class AdminService : IAdminService
    {
        private readonly UnitOfWork _unitOfWork;

        public AdminService(UnitOfWork uof)
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

        public async Task<TotalAccountDto> GetTotalUserPartner()
        {
            return await _unitOfWork.AdminRepo.GetTotalUserPartnerAsync();
        }

        public async Task<List<TopPartnerDto>> GetTopPartner()
        {
            return await _unitOfWork.AdminRepo.GetTopPartnerAsync();
        }
    }
}

