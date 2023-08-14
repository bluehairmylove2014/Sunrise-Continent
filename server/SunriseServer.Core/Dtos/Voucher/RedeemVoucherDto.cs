namespace SunriseServerCore.Dtos.Voucher
{
    public class RedeemVoucherDto
    {
        public int VoucherId { get; set; }
        public int Quantity { get; set; } = 1;
    }
}