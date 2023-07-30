using SunriseServerCore.Dtos;
using SunriseServerCore.Models;


namespace SunriseServer.Services.VoucherService
{
    public interface IVoucherService
    {
        Task<IEnumerable<Voucher>> GetAllVoucher();
        Task<Voucher> GetVoucherById(int VoucherId);
        Task<List<Voucher>> GetAccountVoucher(int AccountId);
        Task<Voucher> CreateVoucher(AddVoucherDto voucher);
        Task<int> UpdateAccountRank(int accountId);

    }
}