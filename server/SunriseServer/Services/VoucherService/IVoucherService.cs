using SunriseServerCore.Dtos;
using SunriseServerCore.Dtos.Voucher;
using SunriseServerCore.Models;


namespace SunriseServer.Services.VoucherService
{
    public interface IVoucherService
    {
        Task<List<VoucherDto>> GetAllVoucher();
        Task<Voucher> GetVoucherById(int VoucherId);

        #nullable enable
        Task<List<VoucherDto>> GetAccountVoucher(int accountId, string? rank);
        #nullable disable

        Task<int> CreateVoucher(AddVoucherDto voucher);
        Task<int> UpdateVoucher(Voucher voucher);
        Task<int> DeleteVoucher(int voucherId);
        Task<int> UpdateRequiredRank(int accountId);
        Task<int> RedeemVoucher(int accountId, int voucherId, int number);
    }
}