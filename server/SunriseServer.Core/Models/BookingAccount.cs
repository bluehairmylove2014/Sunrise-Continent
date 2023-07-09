namespace SunriseServerCore.Models
{
    public class BookingAccount
    {
        public int AccountId { get; set; }
        public int HotelId { get; set; }
        public int RoomTypeId { get; set; }
        public DateOnly CheckIn { get; set; }
        public DateOnly CheckOut { get; set; }
        public int NumberOfRoom { get; set; }
    }
}
