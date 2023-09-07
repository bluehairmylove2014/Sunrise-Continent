using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SunriseServer.Common.Constant;
using SunriseServer.Services.AccountService;
using SunriseServerCore.Common.Helper;
using SunriseServerCore.Dtos;
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
        readonly IAdminRepo _adminService;

        public AdminController(IAccountService accountService, IAdminRepo adminService)
        {
            _accountService = accountService;
            _adminService = adminService;
        }

        [HttpGet("yearly-revenue"), Authorize(Roles = GlobalConstant.Admin)]
        public async Task<ActionResult<List<YealyRevenue>>> GetHotelYearlyRevenue(int? year)
        {
            List<YealyRevenue> result = new();

            try
            {
                result = await _adminService.GetYealyRevenueAsync(year);
            }
            catch (Microsoft.Data.SqlClient.SqlException exception)
            {
                return BadRequest(new {
                    message = exception.Message,
                });
            }

            return Ok(result);
        }

        [HttpGet("weekly-revenue"), Authorize(Roles = GlobalConstant.Admin)]
        public async Task<ActionResult<StatisticsHotelDto>> GetHotelWeeklyRevenue(DateTime? date)
        {
            // StatisticsHotelDto result;
            date ??= DateTime.Now;

            List<WeeklyRevenue> x;

            try
            {
                x = await _adminService.GetWeeklyRevenueAsync(date);
            }
            catch (Microsoft.Data.SqlClient.SqlException exception)
            {
                return BadRequest(new {
                    message = exception.Message,
                });
            }

            return Ok(x);
        }
    }
}
