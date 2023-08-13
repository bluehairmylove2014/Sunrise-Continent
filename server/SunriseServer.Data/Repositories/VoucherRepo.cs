using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using SunriseServerData;
using SunriseServerCore.Dtos;
using SunriseServerCore.Dtos.Voucher;
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

        #nullable enable
        public async Task<List<VoucherBag>> GetAccountVoucherAsync(int accountId, string? rank)
        {
            var check = rank is null ? "null" : rank;
            var str = $"EXEC USP_GetUserVoucher @AccountId={accountId}, @Rank={check};";

            Console.WriteLine(str);
            var result = await _dataContext.VoucherBag.FromSqlInterpolated($"EXECUTE({str})").ToListAsync();
            return result;
        }
        #nullable disable

        public async Task<int> CreateAsync(AddVoucherDto voucher)
        {
            var str = $@"EXEC @Id = USP_AddVoucher @Name=N'{voucher.Name}', @Value={voucher.Value}, @Point={voucher.Point}, @AccountRank='{voucher.AccountRank}';";

            Console.WriteLine(str);

            var result = await _dataContext.Database.ExecuteSqlInterpolatedAsync($"EXECUTE({str})");
            return result;
        }

        public async Task<int> UpdateVoucherAsync(Voucher voucher)
        {
            var builder = new StringBuilder("EXEC USP_UpdateVoucher ");
            builder.Append($"@VoucherId = {voucher.VoucherId}, ");
            builder.Append($"@Name = N\'{voucher.Name}\', ");
            builder.Append($"@Value = {voucher.Value}, ");
            builder.Append($"@Point = {voucher.Point}, ");
            builder.Append($"@AccountRank = '{voucher.AccountRank}';");


            Console.WriteLine(builder.ToString());
            var result = await _dataContext.Database.ExecuteSqlInterpolatedAsync($"EXECUTE({builder.ToString()})");
            return result;
        }

        public async Task<int> DeleteVoucherAsync(int voucherId)
        {
            var result = await _dataContext.Database.ExecuteSqlInterpolatedAsync($"EXEC USP_DeleteVoucher {voucherId}");
            return result;
        }

        public async Task<int> UpdateAccountRankAsync(int accountId)
        {
            var result = await _dataContext.Database.ExecuteSqlInterpolatedAsync($"EXEC USP_UpdateAccountRank @AccountId={accountId};");
            return result;
        }

        public async Task<int> RedeemVoucherAsync(int accountId, int voucherId)
        {
            var result = await _dataContext.Database
                .ExecuteSqlInterpolatedAsync($"EXEC USP_RedeemVoucher @AccountId={accountId}, @VoucherId={voucherId};");
            return result;
        }
    }
}
