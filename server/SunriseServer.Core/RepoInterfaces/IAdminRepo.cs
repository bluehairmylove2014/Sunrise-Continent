using SunriseServerCore.Dtos;
using SunriseServerCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunriseServerCore.RepoInterfaces
{
    public interface IAdminRepo
    {
        Task<List<YealyRevenue>> GetYealyRevenueAsync(int? year);
        Task<List<WeeklyRevenue>> GetWeeklyRevenueAsync(DateTime? date);
    }
}
