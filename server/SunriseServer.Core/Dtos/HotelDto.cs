namespace SunriseServerCore.Dtos
{
    public class HotelDto
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Country { get; set; } = string.Empty;
        public string HotelType { get; set; } = string.Empty;
        public string ProvinceCity { get; set; } = string.Empty;
        public string Address { get; set; } = string.Empty;
        public int Stars { get; set; }
        public double Rating { get; set; }
        public string Description { get; set; } = string.Empty;
        public string Image { get; set; } = string.Empty;
        public double Price { get; set; }
        public int AccountId { get; set; }
        public List<string> Facilities { get; set; }
        public List<string> Services { get; set; }
    }
}