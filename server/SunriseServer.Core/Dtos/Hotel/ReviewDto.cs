namespace SunriseServerCore.Dtos
{
    public class ReviewDto
    {
        public int Id { get; set; }
        public string UserName { get; set; } = string.Empty;
        public string UserAvatar { get; set; } = string.Empty;
        public string ReviewDate { get; set; } = string.Empty;
        public double Points { get; set; }
        public string Content { get; set; } = string.Empty;
    }
}