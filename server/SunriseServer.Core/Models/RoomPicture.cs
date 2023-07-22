namespace SunriseServerCore.Models
{
    public class RoomPicture : ModelBase
    {
        public int HotelId { get; set; }
        public int RoomTypeId { get; set; }
        public int Id { get; set; }
        public string PictureLink { get; set; } = string.Empty;
    }
}
