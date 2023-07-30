using SunriseServerCore.Models;

namespace SunriseServerCore.Dtos.Booking
{
    public class AddBookingDto
    {
        public int AccountId { get; set; }
        public int HotelId { get; set; }
        public int RoomTypeId { get; set; }
        public DateTime CheckIn { get; set; }
        public DateTime CheckOut { get; set; }
        public int NumberOfRoom { get; set; } = 1;
        public int VoucherId { get; set; }
    }
}
