namespace SunriseServer.Models
{
    public class BookingAccount
    {
        public int Id { get; set; }
        public int HotelId { get; set; }
        public string RoomType { get; set; } = string.Empty;
        public DateOnly CheckIn { get; set; }
        public DateOnly CheckOut { get; set; }
        public int NumberOfRoom { get; set; }
    }
}
