namespace SunriseServerCore.Models
{
    // [Keyless]
    public class Review : ModelBase
    {
        public int AccountId { get; set; }
        public int HotelId { get; set; }
        public double Points { get; set; }
        public string Content { get; set; } = string.Empty;
    }
}
