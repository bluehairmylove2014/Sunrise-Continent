namespace SunriseServerCore.Dtos.Booking
{
    public class DeleteBookingDto
    {
        public int AccountId { get; set; }
        public int HotelId { get; set; }
        public int RoomTypeId { get; set; }
        public DateTime CheckIn { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}
