namespace SunriseServer.Services.AccountService
{
    public interface IAccountService
    {
        string GetMyName();
        Task<List<Account>> AddAccount(Account acc);
    }
}
