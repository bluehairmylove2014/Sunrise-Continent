namespace SunriseServerCore.Dtos.Voucher
{
    public class AddVoucherDto
    {
        public string Name { get; set; } = string.Empty;
        public double Value { get; set; }
        public int Point { get; set; }
        public string RequiredRank { get; set; } = "Bronze";
        public int Quantity { get; set; } = 1;
    }
}