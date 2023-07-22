
namespace SunriseServerCore.Dtos.Room
{
    public class RoomAmenitiesDto
    {
        public int HotelId { get; set; }
        public int RoomTypeId { get; set; }

        public List<string> RoomAmenities { get; set; }
    }
}
