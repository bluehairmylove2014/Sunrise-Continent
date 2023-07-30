
namespace SunriseServerCore.Models
{
    public class VoucherBag : ModelBase
    {
        public int AccountId { get; set; }
        public int VoucherId { get; set; }
        public int Quantity { get; set; }
    }
}
