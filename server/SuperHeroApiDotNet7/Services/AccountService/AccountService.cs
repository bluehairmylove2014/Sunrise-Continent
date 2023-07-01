using Microsoft.EntityFrameworkCore;
using SunriseServer.Models;
using System.Security.Claims;

namespace SunriseServer.Services.AccountService
{
    public class AccountService : IAccountService
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly DataContext _context;

        public AccountService(IHttpContextAccessor httpContextAccessor, DataContext dataContext)
        {
            _httpContextAccessor = httpContextAccessor;
            _context = dataContext;
        }

        public async Task<List<Account>> AddAccount(Account acc)
        {
            _context.Accounts.Add(acc);
            await _context.SaveChangesAsync();
            return await _context.Accounts.ToListAsync();
        }

        public string GetMyName()
        {
            var result = string.Empty;
            if (_httpContextAccessor.HttpContext != null)
            {
                result = _httpContextAccessor.HttpContext.User.FindFirstValue(ClaimTypes.Name);
            }
            return result!;
        }
    }
}
