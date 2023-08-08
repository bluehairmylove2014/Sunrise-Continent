using SunriseServerCore.Dtos;
using SunriseServerCore.Models;


namespace SunriseServer.Services.VoucherService
{
    public interface IVoucherService
    {
        Task<IEnumerable<Voucher>> GetAllVoucher();
        Task<Voucher> GetVoucherById(int VoucherId);
        Task<List<VoucherBag>> GetAccountVoucher(string email);
        Task<int> CreateVoucher(AddVoucherDto voucher);
        Task<int> UpdateVoucher(Voucher voucher);
        Task<int> DeleteVoucher(int voucherId);
        Task<int> UpdateAccountRank(string email);
        Task<int> RedeemVoucher(string email, int voucherId);
    }
}