using SunriseServerCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SunriseServerCore.Dtos;

namespace SunriseServerCore.RepoInterfaces
{
    public interface IVoucherRepo : IRepository<Voucher>
    {
        Task<List<VoucherBag>> GetAccountVoucherAsync(int accountId);
        Task<int> CreateAsync(AddVoucherDto voucher);
        Task<int> UpdateVoucherAsync(Voucher voucher);
        Task<int> DeleteVoucherAsync(int voucherId);
        Task<int> UpdateAccountRankAsync(int accountId);
        Task<int> RedeemVoucherAsync(int accountId, int voucherId);
    }
}