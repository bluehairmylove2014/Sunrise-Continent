using Microsoft.EntityFrameworkCore;
using SunriseServerCore.Common.Helper;
using SunriseServerCore.Models;
using SunriseServerCore.RepoInterfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SunriseServerData.Repositories
{
    public class AccountRepo : RepositoryBase<Account>, IAccountRepo
    {
        readonly DataContext _dataContext;
        public AccountRepo(DataContext dbContext) : base(dbContext)
        {
            _dataContext = dbContext;
        }

        public override async Task<Account> CreateAsync(Account acc)
        {
            var builder = new StringBuilder(@"
                DECLARE @result INT
                EXEC @result = dbo.USP_AddAccount ");
            builder.Append($"@Username = \'{acc.Username}\', ");
            builder.Append($"@PasswordHash = \'{acc.PasswordHash}\', ");
            builder.Append($"@PasswordSalt = \'{acc.PasswordSalt}\', ");
            builder.Append($"@UserRole = \'{acc.UserRole}\', ");
            builder.Append($"@RefreshToken = \'{acc.RefreshToken}\', ");
            builder.Append($"@TokenCreated = \'{acc.TokenCreated}\', ");
            builder.Append($"@TokenExpires = \'{acc.TokenExpires}\';\n");

            builder.Append($"EXEC USP_GetAccountById @Id = @result;");

            // Console.WriteLine(builder.ToString());
            var result = await _dataContext.Accounts.FromSqlInterpolated($"EXECUTE({builder.ToString()})").ToListAsync();
            return result.FirstOrDefault();
        }

        public async Task<Account> GetByUsername(string username)
        {
            // đ.chí đừng có chạy mấy cái code như này :v, đ.chí liệt kê tui mấy cái danh sách proc cần làm đi
            // Do tên bảng đồ khác nhau tk EF ko làm đc đâu :v
            // Tui chạy trên server tui sẽ ra lỗi :v, có j đ.chí cho tui cái danh sách tui làm r gọi chạy mới trơn :v

            var builder = new StringBuilder($"dbo.USP_GetAccountByUsername @Username = \'{username}\';");

            Console.WriteLine(builder.ToString());
            var result = await _dataContext.Accounts.FromSqlInterpolated($"EXECUTE({builder.ToString()})").ToListAsync();
            return result.FirstOrDefault();
        }
    }
}
