using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using SunriseServerData;
using SunriseServerCore.Dtos;
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

        public async Task<List<Voucher>> GetAccountVoucherAsync(int accountId)
        {
            var result = await _dataContext.Voucher.FromSqlInterpolated($"EXEC USP_GetUserVoucher @AccountId={accountId};").ToListAsync();
            return result;
        }

        public async Task<Voucher> CreateAsync(AddVoucherDto voucher)
        {
            // var builder = new StringBuilder("EXEC USP_AddVoucher ");
            // builder.Append($"@Name=\'{voucher.Name}\', ");
            // builder.Append($"@Value={voucher.Value}, ");
            // builder.Append($"@Point={voucher.Point}, ");
            // builder.Append($"@AccountRank=\'{voucher.AccountRank}\';");

            var str = $@"DECLARE @Id INT;
                         EXEC @Id = USP_AddVoucher @Name='{voucher.Name}', @Value='{voucher.Value}', @Point='{voucher.Point}', @AccountRank='{voucher.AccountRank}';
                         EXEC USP_GetVoucherById @VoucherId=@Id;".Trim();

            var result = await _dataContext.Voucher.FromSqlInterpolated($"EXECUTE({str})").ToListAsync();
            return result.FirstOrDefault();
        }
        
        public async Task<int> UpdateVoucherAsync(Voucher voucher)
        {
            var result = await _dataContext.Database.ExecuteSqlInterpolatedAsync($"Print 1;");
            return result;
        }
        
        public async Task<int> DeleteVoucherAsync(int VoucherId)
        {
            var result = await _dataContext.Database.ExecuteSqlInterpolatedAsync($"Print 1;");
            return result;
        }

        public async Task<int> UpdateAccountRankAsync(int accountId)
        {
            var result = await _dataContext.Database.ExecuteSqlInterpolatedAsync($"EXEC USP_UpdateAccountRank @AccountId={accountId};");
            return result;
        }
    }
}
