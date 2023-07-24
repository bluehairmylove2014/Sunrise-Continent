namespace SunriseServerCore.Dtos.Room
{
    public class RoomDto
    {
        public int HotelId { get; set; }
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public int Vacancy { get; set; }
        public double Size { get; set; }
        public double Price { get; set; }
        public string RoomInfo { get; set; } = string.Empty;
        public string RoomView { get; set; } = string.Empty;
        public string BedType { get; set; } = string.Empty;
        public List<PictureDto> Picture { get; set; }
        public List<string> Facility { get; set; }
        public List<string> Service { get; set; }
    }
}
