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
        Task<List<VoucherBag>> GetAccountVoucherAsync(string email);
        Task<int> CreateAsync(AddVoucherDto voucher);
        Task<int> UpdateVoucherAsync(Voucher voucher);
        Task<int> DeleteVoucherAsync(int voucherId);
        Task<int> UpdateAccountRankAsync(string email);
        Task<int> RedeemVoucherAsync(string email, int voucherId);
    }
}