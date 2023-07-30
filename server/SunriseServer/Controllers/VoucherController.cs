using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SunriseServer.Common.Constant;
using SunriseServer.Services.BookingService;
using SunriseServer.Services.AccountService;
using SunriseServer.Services.VoucherService;
using SunriseServer.Services.RoomService;
using SunriseServer.Common.Helper;
using SunriseServerCore.Dtos.Booking;
using SunriseServer.Services.HotelService;
using System.Security.Claims;
using SunriseServerCore.Dtos;
using SunriseServerCore.Common.Enum;

namespace SunriseServer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class voucherController : ControllerBase
    {
        readonly IVoucherService _voucherService;

        public voucherController(IVoucherService voucherService)
        {
            _voucherService = voucherService;
        }

        [HttpGet("")]
        public async Task<ActionResult<List<Voucher>>> GetAllVoucher()
        {
            var result = await _voucherService.GetAllVoucher();

            if (result == null)
                return BadRequest("Cannot create voucher.");

            return Ok(result.ToList());
        }

        [HttpPost("")] // , Authorize(Roles = GlobalConstant.User)
        public async Task<ActionResult<ResponseMessageDetails<Voucher>>> AddVoucher(AddVoucherDto voucherDto)
        {
            var result = await _voucherService.CreateVoucher(voucherDto);

            if (result == null)
                return BadRequest("Cannot create voucher.");

            return Ok(new ResponseMessageDetails<Voucher>("Create voucher successfully", result));
        }

        [HttpPut("account-rank")] // , Authorize(Roles = GlobalConstant.User)
        public async Task<ActionResult<ResponseMessageDetails<int>>> UpdateAccountRank(int accountId)
        {
            var result = await _voucherService.UpdateAccountRank(accountId);

            if (result == 0)
                return NotFound("Account not found.");

            return Ok(new ResponseMessageDetails<int>("Update account rank successfully", result));
        }
        
        [HttpPost("redeem")]
        public async Task<ActionResult<ResponseMessageDetails<int>>> RedeemVoucher(int accountId, int VoucherId)
        {
            var result = await _voucherService.UpdateAccountRank(accountId);

            if (result == 0)
                return NotFound("Account not found.");

            return Ok(new ResponseMessageDetails<int>("Redeem voucher successfully", result));
        }
        
    }
}
