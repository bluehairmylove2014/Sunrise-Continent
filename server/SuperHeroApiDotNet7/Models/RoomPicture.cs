namespace SunriseServer.Models
{
    public class RoomPicture
    {
        public int Id { get; set; }
        public int HotelId { get; set; }
        public int RoomTypeId { get; set; }
        public string PictureLink { get; set; } = string.Empty;
    }
}
