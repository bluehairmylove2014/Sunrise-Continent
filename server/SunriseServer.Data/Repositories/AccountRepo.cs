﻿using Microsoft.EntityFrameworkCore;
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
            var builder = new StringBuilder("EXECUTE dbo.USP_AddAccount ");
            builder.Append($"@Username = \'{acc.Username}\', ");
            builder.Append($"@PasswordHash = \'{acc.PasswordHash}\', ");
            builder.Append($"@PasswordSalt = \'{acc.PasswordSalt}\', ");
            builder.Append($"@UserRole = \'{acc.UserRole}\';");

            Console.WriteLine(builder.ToString());
            await _dataContext.Database.ExecuteSqlInterpolatedAsync($"EXECUTE sp_executesql {builder.ToString()}");
            return acc;
        }

        public async Task<Account> GetByUsername(string username)
        {
            var result =  await _dataContext.Account.FirstOrDefaultAsync(x => x.Username == username);
            return result;
        }
    }
}
