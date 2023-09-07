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
            var builder = new StringBuilder("DECLARE @result INT;\nEXEC @result = dbo.USP_AddAccount ");
            builder.Append($"@Id = {acc.Id}, ");
            builder.Append($"@Email = \'{acc.Email}\', ");
            builder.Append($"@FullName = N\'{acc.FullName}\', ");
            builder.Append($"@PasswordHash = \'{acc.PasswordHash}\', ");
            builder.Append($"@PasswordSalt = \'{acc.PasswordSalt}\', ");
            builder.Append($"@UserRole = \'{acc.UserRole}\', ");
            builder.Append($"@RefreshToken = \'{acc.RefreshToken}\', ");
            builder.Append($"@TokenCreated = \'{acc.TokenCreated}\', ");
            builder.Append($"@TokenExpires = \'{acc.TokenExpires}\';\n");

            builder.Append($"EXEC USP_GetAccountById @Id = @result;");

            Console.WriteLine(builder.ToString());
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

        public async Task<Account> GetAccountByIdAsync(int accountId)
        {
            var result = await _dataContext.Account
                .FromSqlInterpolated($"EXEC USP_GetAccountById @Id={accountId};")
                .ToListAsync();

            return result.FirstOrDefault();
        }

        public async Task<int> GetNextAccountIdAsync()
        {
            var builder = new StringBuilder("dbo.USP_GetNextColumnId 'ACCOUNT', 'Id'");

            var result = await _dataContext.Set<MyFuctionReturn>()
                .FromSqlInterpolated($"DECLARE @Id INT;EXEC @Id = dbo.USP_GetNextColumnId 'ACCOUNT', 'Id';SELECT @Id;")
                .ToListAsync();

            return (result.FirstOrDefault()).MyValue;
        }

        public async Task<PersonalDetail> GetAccountDetailsByIdAsync(int accountId)
        {
            var result = await _dataContext.PersonalDetail
                .FromSqlInterpolated($"EXEC USP_GetAccountDetailById @AccountId={accountId};").ToListAsync();
            return result.FirstOrDefault();
        }

        public async Task<PersonalDetail> GetAccountDetailSocialAsync(string email, string fullName)
        {
            var result = await _dataContext.PersonalDetail
                .FromSqlInterpolated($"EXEC USP_GetAccountDetailSocial @Email={email}, @FullName={fullName};").ToListAsync();
            return result.FirstOrDefault();
        }

        public async Task<int> CreateSocialAsync(CreateSocialDto acc)
        {
            var builder = new StringBuilder(@"
                DECLARE @result INT
                EXEC @result = USP_AddAccountSocial ");
            builder.Append($"@Id = {acc.Id}, ");
            builder.Append($"@Email = \'{acc.Email}\', ");
            builder.Append($"@FullName = N\'{acc.FullName}\', ");
            builder.Append($"@RefreshToken = \'{acc.RefreshToken}\', ");
            builder.Append($"@TokenCreated = \'{acc.TokenCreated}\', ");
            builder.Append($"@TokenExpires = \'{acc.TokenExpires}\',");
            builder.Append($"@UserRole = \'{acc.UserRole}\';");

            // Console.WriteLine(builder.ToString());
            var result = await _dataContext.Database.ExecuteSqlInterpolatedAsync($"EXECUTE({builder.ToString()})");
            return result;
        }

        public async Task<int> UpdatePersonalInfoByIdAsync(int accountId, UpdateInfoDto dataDto)
        {
            // USP_UpdateAccountPersonalInfo
            var builder = new StringBuilder($"EXEC USP_UpdateAccountPersonalInfo ");
            builder.Append($"@AccountId = {accountId}, ");
            builder.Append($"@FullName = N\'{dataDto.FullName}\', ");
            builder.Append($"@PhoneNumber = \'{dataDto.PhoneNumber}\', ");
            builder.Append($"@DateOfBirth = \'{dataDto.DateOfBirth}\', ");
            builder.Append($"@Gender = \'{dataDto.Gender}\', ");
            builder.Append($"@Image = \'{dataDto.Image}\';");

            // Console.WriteLine(builder.ToString());
            var result = await _dataContext.Database.ExecuteSqlInterpolatedAsync($"EXECUTE({builder.ToString()})");
            return result;
        }

        public async Task<int> BanAccountAsync(BanAccountDto acc)
        {
            var builder = new StringBuilder($"EXEC USP_BanAccount @AccountId={acc.AccountId};");

            Console.WriteLine(builder.ToString());
            var result = await _dataContext.Database.ExecuteSqlInterpolatedAsync($"EXECUTE({builder.ToString()})");
            return result;
        }

        // AccountInfoDto
        public async Task<List<AccountInfoDto>> GetAllAccountInfoAsync(FilterAccountDto searchAccount)
        {
            var builder = new StringBuilder($"EXEC USP_FindAccountByName ");
            builder.Append($"@Name = N\'{searchAccount.Name}\'");
            if (!string.IsNullOrEmpty(searchAccount.Role))
                builder.Append($", @Role = \'{searchAccount.Role}\'");
            if (!string.IsNullOrEmpty(searchAccount.Gender))
                builder.Append($", @Gender = N\'{searchAccount.Gender}\'");
            if (!string.IsNullOrEmpty(searchAccount.SortingCol))
                builder.Append($", @SortingCol = \'{searchAccount.SortingCol}\'");
            if (!string.IsNullOrEmpty(searchAccount.SortType))
                builder.Append($", @SortType = \'{searchAccount.SortType}\'");
            builder.Append(";");

            Console.WriteLine(builder.ToString());
            var result = await _dataContext.Set<AccountInfoDto>()
                .FromSqlInterpolated($"EXECUTE({builder.ToString()})")
                .IgnoreQueryFilters()
                .ToListAsync();
            return result;
        }

        public async Task<Account> GetMatchingRefreshToken(string refreshToken)
        {
            var builder = new StringBuilder($"dbo.USP_GetMatchingRefreshToken @RefreshToken = \'{refreshToken}\';");

            Console.WriteLine(builder.ToString());
            var result = await _dataContext.Account.FromSqlInterpolated($"EXECUTE({builder.ToString()})").ToListAsync();
            return result.FirstOrDefault();
        }
    }
}
