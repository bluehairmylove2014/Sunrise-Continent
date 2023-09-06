using Microsoft.EntityFrameworkCore;
using SunriseServerData;
using SunriseServerCore.Models;
using System.Security.Claims;
using SunriseServerCore.Dtos;


namespace SunriseServer.Services.AccountService
{
    public class AccountService : IAccountService
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly UnitOfWork _unitOfWork;
        public AccountService(IHttpContextAccessor httpContextAccessor, UnitOfWork unitOfWork)
        {
            _httpContextAccessor = httpContextAccessor;
            _unitOfWork = unitOfWork;
        }

        public async Task<Account> AddAccount(Account acc)
        {
            return await _unitOfWork.AccountRepo.CreateAsync(acc);
        }

        public async Task<Account> AddAccountSocial(Account acc)
        {
            return await _unitOfWork.AccountRepo.CreateAsync(acc);
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

        public int GetMyId()
        {
            var result = 0;
            if (_httpContextAccessor.HttpContext != null)
            {
                var str = _httpContextAccessor.HttpContext.User.FindFirstValue(ClaimTypes.Sid);
                Int32.TryParse(str, out result);
            }
            return result!;
        }

        public async Task<int> GetNextAccountId()
        {
            return await _unitOfWork.AccountRepo.GetNextAccountIdAsync();
        }

        public async Task<Account> GetByUsername(string username)
        {
            return await _unitOfWork.AccountRepo.GetByUsername(username);
        }

        public async Task<Account> GetById(int id)
        {
            return await _unitOfWork.AccountRepo.GetByIdAsync(id);
        }

        public async Task<Account> UpdateAccount(Account acc)
        {
            return await _unitOfWork.AccountRepo.UpdateAsync(acc);
        }

        public void SaveChanges()
        {
            _unitOfWork.SaveChanges();
        }

        public async Task<PersonalDetail> GetAccountDetailsByEmail(string email)
        {
            return await _unitOfWork.AccountRepo.GetAccountDetailsByEmailAsync(email);
        }

        public async Task<PersonalDetail> GetAccountDetailSocial(string email, string fullName)
        {
            return await _unitOfWork.AccountRepo.GetAccountDetailSocialAsync(email, fullName);
        }

        public async Task<int> CreateSocial(CreateSocialDto acc)
        {
            return await _unitOfWork.AccountRepo.CreateSocialAsync(acc);
        }

        public async Task<PersonalDetail> GetAccountDetailsById(int accountId)
        {
            return await _unitOfWork.AccountRepo.GetAccountDetailsByIdAsync(accountId);
        }

        public async Task<Account> GetAccountById(int accountId)
        {
            return await _unitOfWork.AccountRepo.GetAccountByIdAsync(accountId);
        }

        public async Task<int> UpdatePersonalInfoById(int accountId, UpdateInfoDto dataDto)
        {
            return await _unitOfWork.AccountRepo.UpdatePersonalInfoByIdAsync(accountId, dataDto);
        }

        public async Task<int> BanAccount(BanAccountDto acc)
        {
            return await _unitOfWork.AccountRepo.BanAccountAsync(acc);
        }

        public async Task<List<AccountInfoDto>> GetAllAccountInfo(FilterAccountDto searchAccount)
        {
            return await _unitOfWork.AccountRepo.GetAllAccountInfoAsync(searchAccount);
        }
    }
}
