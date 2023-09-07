using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SunriseServer.Common.Constant;
using SunriseServer.Services.AccountService;
using SunriseServerCore.Common.Helper;
using SunriseServerCore.Dtos;
using SunriseServerCore.Dtos.Hotel;
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
                return NotFound(new {
                    message = "Không tìm thấy tài khoản"
                });

            return Ok(result);
        }

        [HttpGet(""), Authorize]
        public async Task<ActionResult<Account>> GetCurrentAccountById()
        {
            Int32.TryParse(User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.Sid)?.Value, out int accountId);
            var result =  await _accountService.GetAccountById(accountId);
            if (result is null)
                return NotFound(new {
                    message = "Không tìm thấy tài khoản"
                });

            return Ok(result);
        }

        [HttpPut(""), Authorize]
        public async Task<ActionResult<int>> UpdateAccount(Account request)
        {
            var result = await _accountService.UpdateAccount(request);
            if (result is null)
                return NotFound(new {
                    message = "Không tìm thấy tài khoản"
                });

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
                return BadRequest(new
                {
                    message = exception.Message
                });
            }

            return Ok(new ResponseMessageDetails<int>("Cập nhật tài khoản thành công", result));
        }

        [HttpPut("ban"), Authorize(Roles = GlobalConstant.Admin)]
        public async Task<ActionResult<ResponseMessageDetails<int>>> BanAccount(BanAccountDto acc)
        {
            int result = 0;
            try
            {
                result = await _accountService.BanAccount(acc);
            }
            catch (Microsoft.Data.SqlClient.SqlException exception)
            {
                return BadRequest(new {
                    message = exception.Message
                });
            }
            catch (Exception)
            {
                return BadRequest(new {
                    message = "Có lỗi xảy ra trong quá trình cấm/mở cấm tài khoản"
                });
            }

            return Ok(new ResponseMessageDetails<int>("Cấm/Mở cấm tài khoản thành công", result));
        }

        [HttpGet("search"), Authorize(Roles = GlobalConstant.Admin)]
        public async Task<ActionResult<ResponseMessageDetails<int>>> SearchAccount(
            [FromQuery] string name,
            [FromQuery] string role,
            [FromQuery] string gender,
            [FromQuery] PagingDto pageDto,
            [FromQuery] string sortingCol,
            [FromQuery] string sortType
        )
        {
            List<AccountInfoDto> result;
            try
            {
                result = await _accountService.GetAllAccountInfo(new FilterAccountDto(name, role, gender, sortingCol, sortType));
            }
            catch (Microsoft.Data.SqlClient.SqlException exception)
            {
                return BadRequest(new {
                    message = exception.Message
                });
            }
            catch (Exception ex)
            {
                return BadRequest(new {
                    message = ex.Message
                });
            }

            var Accounts = PageList<AccountInfoDto>.ToPageList(result.AsQueryable(), pageDto.page_number, pageDto.page_size);

            return Ok(new {
                Accounts,
                totalCount = Accounts.TotalCount,
                pageSize = Accounts.PageSize,
                currentPage = Accounts.CurrentPage,
                totalPages = Accounts.TotalPages,
                hasNext = Accounts.HasNext,
                hasPrevious = Accounts.HasPrevious
            });
        }
    }
}
