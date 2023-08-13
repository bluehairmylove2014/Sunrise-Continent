namespace SunriseServerCore.Models
{
    // [Keyless]
    public class Review : ModelBase
    {
        public long Id { get; set; }
        public string UserName { get; set; } = string.Empty;
        public string UserAvatar { get; set; } = string.Empty;
        public DateTime ReviewDate { get; set; }
        public double Points { get; set; }
        public string Content { get; set; } = string.Empty;
    }
}
