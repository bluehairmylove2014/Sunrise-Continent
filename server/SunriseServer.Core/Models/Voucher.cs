
namespace SunriseServerCore.Models
{
    public class Voucher : ModelBase
    {
        public int VoucherId { get; set; }
        public string Name { get; set; } = string.Empty;
        public int Value { get; set; }
        public int Point { get; set; }
        public string UserRank { get; set; } = string.Empty;
    }
}
