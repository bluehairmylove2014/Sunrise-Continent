using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SunriseServer.Common.Constant;
using SunriseServer.Services.AccountService;
using SunriseServer.Services.AdminService;
using SunriseServerCore.Common.Helper;
using SunriseServerCore.Dtos;
using SunriseServerCore.Dtos.Admin;
using SunriseServerCore.Dtos.Hotel;
using SunriseServerCore.RepoInterfaces;
using System.Security.Claims;


namespace SunriseServer.Controllers
{
    [Route("api/admin")]
    [ApiController]
    public class AdminController : ControllerBase
    {
        readonly IAccountService _accountService;
        readonly IAdminService _adminService;

        public AdminController(IAccountService accountService, IAdminService adminService)
        {
            _accountService = accountService;
            _adminService = adminService;
        }

        [HttpGet("yearly-revenue"), Authorize(Roles = GlobalConstant.Admin)]
        public async Task<ActionResult<List<YealyRevenue>>> GetHotelYearlyRevenue(int? year)
        {
            List<YealyRevenue> result;

            try
            {
                result = await _adminService.GetYealyRevenue(year);
            }
            catch (Microsoft.Data.SqlClient.SqlException exception)
            {
                return BadRequest(new {
                    message = exception.Message,
                });
            }

            return Ok(result);
        }

        [HttpGet("weekly-revenue")] // , Authorize(Roles = GlobalConstant.Admin)
        public async Task<ActionResult<StatisticsAdminDto>> GetHotelWeeklyRevenue(DateTime? date)
        {
            StatisticsAdminDto result;
            date ??= DateTime.Now;

            try
            {
                var totalAccount = await _adminService.GetTotalUserPartner();
                result = new StatisticsAdminDto () {
                    Revenue = await _adminService.GetWeeklyRevenue(date),
                    Accounts = await _adminService.GetTopPartner(),
                    TotalPartner = totalAccount.TotalPartner,
                    TotalUser = totalAccount.TotalUser,
                };
                result.Revenue.ForEach(p => {
                    result.TotalRevenue += p.ThisWeek;
                    result.LastRevenue += p.LastWeek;
                });
                
            }
            catch (Microsoft.Data.SqlClient.SqlException exception)
            {
                return BadRequest(new {
                    message = exception.Message,
                });
            }

            return Ok(result);
        }
    }
}
