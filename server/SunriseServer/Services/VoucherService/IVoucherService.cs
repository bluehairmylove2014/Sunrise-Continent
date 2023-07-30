using SunriseServerCore.Dtos;
using SunriseServerCore.Models;


namespace SunriseServer.Services.VoucherService
{
    public interface IVoucherService
    {
        Task<IEnumerable<Voucher>> GetAllVoucher();
        Task<Voucher> GetVoucherById(int VoucherId);
        Task<IEnumerable<Voucher>> GetAccountVoucher(int AccountId);
    }
}