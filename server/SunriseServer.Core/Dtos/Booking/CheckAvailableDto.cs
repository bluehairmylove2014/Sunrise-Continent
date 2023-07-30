using SunriseServerCore.Models;

namespace SunriseServerCore.Dtos.Booking
{
    public class CheckAvailableDto
    {
        public int HotelId { get; set; }
        public int RoomTypeId { get; set; }
        public int NumberOfRoom { get; set; } = 1;
        public DateTime CheckIn { get; set; }
        public DateTime CheckOut { get; set; }
    }
}
