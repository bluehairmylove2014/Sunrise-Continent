global using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;
using SunriseServerData;
using SunriseServer.Common.Helper;
using System;
using System.Text;
using SunriseServerCore.Models;

namespace SunriseServer.Data
{
    class AccountHandler
    {
        // khong chay proc trong day, chay trong folder Repositories
        private DataContext _context;

        public AccountHandler(DataContext context)
        {
            _context = context;
        }

        public async Task<List<Account>> GetAll()
        {
            // Cần chỉnh lại schema hoặc tạo một schema mới để gọi dữ liệu từ server.

            var result = await _context.Accounts.FromSqlInterpolated($"USP_GetAllAccount").ToListAsync();
            return result;
        }

        public async Task<int> Add(Account acc)
        {
            var builder = new StringBuilder("EXECUTE dbo.USP_AddAccount ");
            builder.Append($"@Username = \'{acc.Username}\', ");
            builder.Append($"@PasswordHash = \'{Helper.ByteArrayToString(acc.PasswordHash)}\', ");
            builder.Append($"@PasswordSalt = \'{Helper.ByteArrayToString(acc.PasswordSalt)}\';");

            Console.WriteLine(builder.ToString());

            return await _context.Database.ExecuteSqlInterpolatedAsync($"EXECUTE sp_executesql {builder.ToString()}");
        }

        // USP_AddAccount
    }
}
