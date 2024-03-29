﻿using SunriseServerCore.Dtos;
using SunriseServerCore.Models;
using SunriseServerData;

namespace SunriseServer.Services.AccountService
{
    public interface IAccountService
    {
        string GetMyName();
        Task<int> GetNextAccountId();
        Task<Account> AddAccount(Account acc);
        Task<Account> AddAccountSocial(Account acc);
        Task<Account> GetById(int accountId);
        Task<Account> GetByUsername(string username);
        Task<PersonalDetail> GetAccountDetailsByEmail(string username);
        Task<Account> UpdateAccount(Account acc);
        void SaveChanges();
        Task<int> CreateSocial(CreateSocialDto acc);
        Task<PersonalDetail> GetAccountDetailSocial(string email, string fullName);
        Task<PersonalDetail> GetAccountDetailsById(int accountId);
        Task<Account> GetAccountById(int accountId);
        Task<int> UpdatePersonalInfoById(int accountId, UpdateInfoDto dataDto);
        Task<int> BanAccount(BanAccountDto acc);
        Task<List<AccountInfoDto>> GetAllAccountInfo(FilterAccountDto searchAccount);
        Task<Account> FindMatchingRefreshToken(string refreshToken);
    }
}
