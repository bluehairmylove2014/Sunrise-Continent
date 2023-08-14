using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SunriseServer.Common.Constant;
using SunriseServer.Services.AccountService;
using SunriseServer.Services.HotelService;
using System.Data;

namespace SunriseServer.Controllers
{
    [Route("api/account")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        readonly IAccountService _accountService;

        public AccountController(IAccountService accountService)
        {
            _accountService = accountService;
        }

        [HttpGet("current-account"), Authorize(Roles = GlobalConstant.User)]
        public async Task<ActionResult<PersonalDetail>> GetCurrentAccount()
        {
            // lấy điểm của user
            var result = await _accountService.GetAccountDetailsByEmail(User.Identity.Name);
            if (result is null)
                return NotFound("Account not found");

            return Ok(result);
        }

        [HttpGet("username"), Authorize(Roles = GlobalConstant.User)]
        public async Task<ActionResult<Hotel>> GetAccountByUsername(string username)
        {
            var result =  await _accountService.GetByUsername(username);
            if (result is null)
                return NotFound("Account not found");

            return Ok(result);
        }

        [HttpPut(""), Authorize(Roles = GlobalConstant.User)]
        public async Task<ActionResult<List<Hotel>>> UpdateAccount(int id, Account request)
        {
            var result = await _accountService.UpdateAccount(request);
            if (result is null)
                return NotFound("Account not found.");

            return Ok(result);
        }

        [HttpPut("personal-info"), Authorize(Roles = GlobalConstant.User)]
        public async Task<ActionResult<List<Hotel>>> UpdateAccountPersonalInfo(int id, Account request)
        {
            var result = await _accountService.UpdateAccount(request);
            if (result is null)
                return NotFound("Account not found.");

            return Ok(result);
        }
    }
}
