using SunriseServerCore.Dtos;
using SunriseServerCore.Models;


namespace SunriseServer.Services.VoucherService
{
    public interface IVoucherService
    {
        Task<IEnumerable<Voucher>> GetAllVoucher();
        Task<Voucher> GetVoucherById(int VoucherId);
        Task<List<VoucherBag>> GetAccountVoucher(int AccountId);
        Task<int> CreateVoucher(AddVoucherDto voucher);
        Task<int> UpdateVoucher(Voucher voucher);
        Task<int> DeleteVoucher(int voucherId);
        Task<int> UpdateAccountRank(int accountId);
        Task<int> RedeemVoucher(int accountId, int voucherId);
    }
}