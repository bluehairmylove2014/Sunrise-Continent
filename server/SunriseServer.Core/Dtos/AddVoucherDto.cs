namespace SunriseServerCore.Dtos
{
    public class AddVoucherDto
    {
        public string Name { get; set; } = string.Empty;
        public int Value { get; set; }
        public int Point { get; set; }
        public string AccountRank { get; set; } = "Bronze";
    }
}