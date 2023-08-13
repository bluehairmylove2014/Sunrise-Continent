namespace SunriseServerCore.Dtos.Voucher
{
    public class VoucherDto
    {
        public int VoucherId { get; set; }
        public string Name { get; set; } = string.Empty;
        public double Value { get; set; }
        public int Point { get; set; }
        public int Quantity { get; set; }
        public string RequiredRank { get; set; } = string.Empty;
    }
}