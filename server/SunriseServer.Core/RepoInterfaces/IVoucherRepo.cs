using SunriseServerCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunriseServerCore.RepoInterfaces
{
    public interface IVoucherRepo : IRepository<Voucher>
    {
        Task<IEnumerable<Voucher>> GetAccountVoucherAsync(int accountId);
    }
}