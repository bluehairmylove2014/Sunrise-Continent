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
        Task<List<Voucher>> GetAccountVoucherAsync(int accountId);
        Task<Voucher> CreateAsync(AddVoucherDto voucher);
        Task<int> UpdateAccountRankAsync(int accountId);

    }
}