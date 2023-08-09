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
    }
}
