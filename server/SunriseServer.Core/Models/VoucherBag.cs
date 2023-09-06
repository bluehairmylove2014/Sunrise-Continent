
namespace SunriseServerCore.Models
{
    public class VoucherBag : ModelBase
    {
        public int AccountId { get; set; }
        public int VoucherId { get; set; }
        public string Name { get; set; } = string.Empty;
        public double Value { get; set; }
        public int Point { get; set; }
        public string RequiredRank { get; set; } = string.Empty;
        public int Quantity { get; set; }
    }
}
