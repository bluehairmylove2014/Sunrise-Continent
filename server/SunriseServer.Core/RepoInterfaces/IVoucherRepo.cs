using SunriseServerCore.Models;
using SunriseServerCore.Dtos.Voucher;

namespace SunriseServerCore.RepoInterfaces
{
    public interface IVoucherRepo : IRepository<Voucher>
    {
        #nullable enable
        Task<List<VoucherBag>> GetAccountVoucherAsync(int accountId, string? rank);
        Task<List<VoucherBag>> GetAllVoucherAsync();
        #nullable disable

        Task<int> CreateAsync(AddVoucherDto voucher);
        Task<int> UpdateVoucherAsync(Voucher voucher);
        Task<int> DeleteVoucherAsync(int voucherId);
        Task<int> UpdateRequiredRankAsync(int accountId);
        Task<int> RedeemVoucherAsync(int accountId, int voucherId, int number);
    }
}