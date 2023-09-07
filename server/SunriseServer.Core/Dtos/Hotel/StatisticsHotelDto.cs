using SunriseServerCore.Models;

namespace SunriseServerCore.Dtos.Hotel
{
    public class StatisticsHotelDto
    {
        public List<WeeklyRevenue> Revenue { get; set; }
        public List<TopAccountInfoDto> Accounts { get; set; }
        public long TotalRevenue { get; set; } = 0;
        public int TotalReview { get; set; } = 0;
        public int TotalOrder { get; set; } = 0;
        public long LastRevenue { get; set; } = 0;
        public int LastReview { get; set; } = 0;
        public int LastOrder { get; set; } = 0;
    }
}
