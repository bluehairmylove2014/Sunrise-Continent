namespace SunriseServerCore.Dtos.Room
{
    public class CheckRoomAvailabilityDto
    {
        public int HotelId { get; set; }
        public int RoomTypeId { get; set; }
        public int NumberOfRoom { get; set; }
        public DateTime CheckIn { get; set; }
        public DateTime CheckOut { get; set; }
    }
}
