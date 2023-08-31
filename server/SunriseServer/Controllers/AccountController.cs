using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SunriseServer.Common.Constant;
using SunriseServer.Services.AccountService;
using SunriseServer.Services.HotelService;
using SunriseServerCore.Dtos;
using System.Data;
using System.Security.Claims;


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

        [HttpGet("current-account"), Authorize]
        public async Task<ActionResult<PersonalDetail>> GetCurrentAccount()
        {
            Int32.TryParse(User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.Sid)?.Value, out int accountId);
            var result = await _accountService.GetAccountDetailsById(accountId);

            if (result is null)
                return NotFound("Account not found");

            return Ok(result);
        }

        [HttpGet("username"), Authorize(Roles = GlobalConstant.User)]
        public async Task<ActionResult<Account>> GetAccountByUsername(string username)
        {
            var result =  await _accountService.GetByUsername(username);
            if (result is null)
                return NotFound("Account not found");

            return Ok(result);
        }

        [HttpPut(""), Authorize]
        public async Task<ActionResult<int>> UpdateAccount(Account request)
        {
            var result = await _accountService.UpdateAccount(request);
            if (result is null)
                return NotFound("Account not found.");

            return Ok(result);
        }

        [HttpPut("personal-info"), Authorize]
        public async Task<ActionResult<ResponseMessageDetails<int>>> UpdateAccountPersonalInfo(UpdateInfoDto request)
        {
            Int32.TryParse(User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.Sid)?.Value, out int accountId);
            int result = 0;
            
            try
            {
                result = await _accountService.UpdatePersonalInfoById(accountId, request);
            }
            catch (Microsoft.Data.SqlClient.SqlException exception)
            {
                return BadRequest(exception.Message);
            }

            return Ok(new ResponseMessageDetails<int>("Update account successfully", result));
        }
    }
}
