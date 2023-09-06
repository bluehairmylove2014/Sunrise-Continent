
namespace SunriseServerCore.Models
{
    public class Voucher : ModelBase
    {
        public int VoucherId { get; set; }
        public string Name { get; set; } = string.Empty;
        public double Value { get; set; }
        public int Point { get; set; }
        public string RequiredRank { get; set; } = string.Empty;
        public int Quantity { get; set; }
    }
}
