namespace SunriseServerCore.Models
{
    public class BookingAccount : ModelBase
    {
        public int BookingId { get; set; }
        public int AccountId { get; set; }
        public int HotelId { get; set; }
        public int RoomTypeId { get; set; }
        public DateTime CheckIn { get; set; }
        public DateTime CheckOut { get; set; }
        public int NumberOfRoom { get; set; } = 1;
        public int VoucherId { get; set; }
        public int Total { get; set; }
        public bool Paid { get; set; } = false; //-- 1 = True, 0 = False
        public DateTime CreatedAt { get; set; }
    }
}
