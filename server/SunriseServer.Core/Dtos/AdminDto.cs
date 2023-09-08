using SunriseServerCore.Models;

namespace SunriseServerCore.Dtos.Admin
{
    public class StatisticsAdminDto
    {
        public List<WeeklyRevenue> Revenue { get; set; }
        public List<TopPartnerDto> Accounts { get; set; }
        public long TotalRevenue { get; set; } = 0;
        public long LastRevenue { get; set; } = 0;
        public int TotalPartner { get; set; } = 0;
        public int TotalUser { get; set; } = 0;
    }

    public class TotalAccountDto
    {
        public int TotalPartner { get; set; } = 0;
        public int TotalUser { get; set; } = 0;
    }

    public class TopPartnerDto
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Image { get; set; } = string.Empty;
        public long TotalSpent { get; set; }
    }
}
