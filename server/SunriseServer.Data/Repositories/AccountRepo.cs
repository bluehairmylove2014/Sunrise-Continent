using Microsoft.EntityFrameworkCore;
using SunriseServerCore.Common.Helper;
using SunriseServerCore.Dtos;
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
            builder.Append($"@Id = \'{acc.Id}\', ");
            builder.Append($"@Email = \'{acc.Email}\', ");
            builder.Append($"@FullName = N\'{acc.FullName}\', ");
            builder.Append($"@PasswordHash = \'{acc.PasswordHash}\', ");
            builder.Append($"@PasswordSalt = \'{acc.PasswordSalt}\', ");
            builder.Append($"@UserRole = \'{acc.UserRole}\', ");
            builder.Append($"@RefreshToken = \'{acc.RefreshToken}\', ");
            builder.Append($"@TokenCreated = \'{acc.TokenCreated}\', ");
            builder.Append($"@TokenExpires = \'{acc.TokenExpires}\';\n");

            builder.Append($"EXEC USP_GetAccountById @Id = @result;");

            // Console.WriteLine(builder.ToString());
            var result = await _dataContext.Account.FromSqlInterpolated($"EXECUTE({builder.ToString()})").ToListAsync();
            return result.FirstOrDefault();
        }

        public async Task<Account> GetByUsername(string username)
        {
            var builder = new StringBuilder($"dbo.USP_GetAccountByUsername @Email = \'{username}\';");

            Console.WriteLine(builder.ToString());
            var result = await _dataContext.Account.FromSqlInterpolated($"EXECUTE({builder.ToString()})").ToListAsync();
            return result.FirstOrDefault();
        }

        public override async Task<Account> GetByIdAsync(int id)
        {
            var builder = new StringBuilder($"dbo.USP_GetAccountById @Id = \'{id}\';");

            Console.WriteLine(builder.ToString());
            var result = await _dataContext.Account.FromSqlInterpolated($"EXECUTE({builder.ToString()})").ToListAsync();
            return result.FirstOrDefault();
        }

        public async Task<PersonalDetail> GetAccountDetailsByEmailAsync(string email)
        {
            var result = await _dataContext.PersonalDetail
                .FromSqlInterpolated($"EXEC USP_GetAccountDetailByEmail @Email = {email};").ToListAsync();
            return result.FirstOrDefault();
        }

        // public async Task<int> GetAccountIdByEmail(string email)
        // {
        //     var result = await _dataContext.Set<MyFuctionReturn>()
        //         .FromSqlInterpolated($"select dbo.USF_GetAccountId({email}) as value;")
        //         .ToListAsync();

        //     return (result.FirstOrDefault()).MyValue;
        // }

        public async Task<int> GetNextAccountIdAsync()
        {
            var builder = new StringBuilder("dbo.USP_GetNextColumnId 'ACCOUNT', 'Id'");

            var result = await _dataContext.Set<MyFuctionReturn>()
                .FromSqlInterpolated($"DECLARE @Id INT;EXEC @Id = dbo.USP_GetNextColumnId 'ACCOUNT', 'Id';SELECT @Id;")
                .ToListAsync();

            return (result.FirstOrDefault()).MyValue;
        }

        // public async Task<string> GetAccountEmailByIdAsync(int accountId)
        // {
        //     var result = await _dataContext.PersonalDetail
        //         .FromSqlInterpolated($"EXEC USP_GetAccountDetailById @AccountId={accountId};").ToListAsync();
        //     return "hh";
        // }

        public async Task<PersonalDetail> GetAccountDetailsByIdAsync(int accountId)
        {
            var result = await _dataContext.PersonalDetail
                .FromSqlInterpolated($"EXEC USP_GetAccountDetailById @AccountId={accountId};").ToListAsync();
            return result.FirstOrDefault();
        }

        public async Task<PersonalDetail> GetAccountDetailSocialAsync(string email, string fullName)
        {
            var result = await _dataContext.PersonalDetail
                .FromSqlInterpolated($"EXEC USP_GetAccountSocial @Email={email}, @FullName={fullName};").ToListAsync();
            return result.FirstOrDefault();
        }

        public async Task<int> CreateSocialAsync(CreateSocialDto acc)
        {
            var builder = new StringBuilder(@"
                DECLARE @result INT
                EXEC @result = USP_AddAccountSocial ");
            builder.Append($"@Id = \'{acc.Id}\', ");
            builder.Append($"@Email = \'{acc.Email}\', ");
            builder.Append($"@FullName = N\'{acc.FullName}\', ");
            builder.Append($"@RefreshToken = \'{acc.RefreshToken}\', ");
            builder.Append($"@TokenCreated = \'{acc.TokenCreated}\', ");
            builder.Append($"@TokenExpires = \'{acc.TokenExpires}\';");

            // Console.WriteLine(builder.ToString());
            var result = await _dataContext.Database.ExecuteSqlInterpolatedAsync($"EXECUTE({builder.ToString()})");
            return result;
        }
    }
}
