namespace SunriseServerCore.Dtos.Hotel
{
    public class InputHotelDto
    {
        public string Name { get; set; } = string.Empty;
        public string Country { get; set; } = string.Empty;
        public string HotelType { get; set; } = string.Empty;
        public string ProvinceCity { get; set; } = string.Empty;
        public string Address { get; set; } = string.Empty;
        public int Stars { get; set; } = 0;
        public string Description { get; set; } = string.Empty;
        public string Image { get; set; } = string.Empty;
    }
}
