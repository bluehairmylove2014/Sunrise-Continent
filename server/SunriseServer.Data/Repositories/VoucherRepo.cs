using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using SunriseServerData;
using SunriseServerCore.Models;
using SunriseServerCore.RepoInterfaces;
using SunriseServer.Common.Helper;
using SunriseServerCore.Dtos.Room;
using Microsoft.Data.SqlClient;

namespace SunriseServerData.Repositories
{
    public class VoucherRepo : RepositoryBase<Voucher>, IVoucherRepo
    {
        readonly DataContext _dataContext;
        public VoucherRepo(DataContext dbContext) : base(dbContext) 
        {
            _dataContext = dbContext;
        }

        public override async Task<IEnumerable<Voucher>> GetAllAsync()
        {
            var result = await _dataContext.Voucher.FromSqlInterpolated($"EXEC USP_GetAllVoucher;").ToListAsync();
            return result;
        }

        public override async Task<Voucher> GetByIdAsync(int id)
        {
            var result = await _dataContext.Voucher.FromSqlInterpolated($"EXEC USP_GetVoucherById @VoucherId={id};").ToListAsync();
            return result.FirstOrDefault();
        }

        public async Task<IEnumerable<Voucher>> GetAccountVoucherAsync(int accountId)
        {
            var result = await _dataContext.Voucher.FromSqlInterpolated($"EXEC USP_GetUserVoucher @AccountId={accountId};").ToListAsync();
            return result;
        }
    }
}
