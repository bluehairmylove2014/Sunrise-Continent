namespace SunriseServerCore.Dtos
{
    public class AddReviewDto
    {
        public int HotelId { get; set; }
        public double Points { get; set; }
        public string Content { get; set; } = string.Empty;
    }
}