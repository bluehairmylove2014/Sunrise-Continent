namespace SunriseServerCore.Models
{
    public class RoomFacilityTable : ModelBase
    {
        public int HotelId { get; set; }
        public int RoomId { get; set; }
        public int FacilityId { get; set; }
    }

    public class RoomServiceTable : ModelBase
    {
        public int HotelId { get; set; }
        public int RoomId { get; set; }
        public int ServiceId { get; set; }
    }
}
