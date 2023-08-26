using SunriseServerCore.Dtos;
using SunriseServerCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunriseServerCore.RepoInterfaces
{
    public interface IAccountRepo : IRepository<Account>
    {
        Task<int> GetNextAccountIdAsync();
        Task<Account> GetByUsername(string username);
        // Task<string> GetAccountEmailByIdAsync(int accountId);
        Task<PersonalDetail> GetAccountDetailsByIdAsync(int accountId);
        Task<PersonalDetail> GetAccountDetailsByEmailAsync(string email);
        Task<int> CreateSocialAsync(CreateSocialDto acc);
        Task<PersonalDetail> GetAccountDetailSocialAsync(string email, string fullName); // GetAccountByIdAsync
        Task<Account> GetAccountByIdAsync(int accountId);
        Task<int> UpdatePersonalInfoByIdAsync(int accountId, UpdateInfoDto dataDto);
    }
}
