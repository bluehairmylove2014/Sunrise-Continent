using SunriseServerCore.Models;

namespace SunriseServerCore.Dtos.Hotel
{
    public class StatisticsHotelDto
    {
        public List<WeeklyRevenue> Revenue { get; set; }
        public long TotalRevenue { get; set; } = 0;
        public int TotalReview { get; set; } = 0;
        public int TotalOrder { get; set; } = 0;
    }
}
