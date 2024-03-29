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
        public int Total { get; set; }
        public string FullName { get; set; } = string.Empty;
        public string Nation { get; set; } = string.Empty;
        public DateTime DateOfBirth { get; set; }
        public string Email { get; set; } = string.Empty;
        public string PhoneNumber { get; set; } = string.Empty;
        public string SpecialNeeds { get; set; } = string.Empty;
        public string Notes { get; set; } = string.Empty;
    }
}
