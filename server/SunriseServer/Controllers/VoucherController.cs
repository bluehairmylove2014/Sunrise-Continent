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
    [Route("api/voucher")]
    [ApiController]
    public class VoucherController : ControllerBase
    {
        readonly IVoucherService _voucherService;

        public VoucherController(IVoucherService voucherService)
        {
            _voucherService = voucherService;
        }

        [HttpGet("")]
        public async Task<ActionResult<List<Voucher>>> GetAllVoucher()
        {
            var result = await _voucherService.GetAllVoucher();

            if (result == null)
                return BadRequest("Cannot get voucher.");

            return Ok(result.ToList());
        }

        [HttpGet("bag"), Authorize(Roles = GlobalConstant.User)]
        public async Task<ActionResult<List<Voucher>>> GetVoucherBag()
        {
            Int32.TryParse(User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.Sid)?.Value, out int accountId);
            var result = await _voucherService.GetAccountVoucher(accountId);

            if (result == null)
                return BadRequest("Cannot get account voucher.");

            return Ok(result.ToList());
        }

        [HttpPost(""), Authorize(Roles = GlobalConstant.Admin)]
        public async Task<ActionResult<ResponseMessageDetails<int>>> AddVoucher(AddVoucherDto voucherDto)
        {
            var result = await _voucherService.CreateVoucher(voucherDto);

            if (result == 0)
                return BadRequest("Cannot create voucher.");

            return Ok(new ResponseMessageDetails<int>("Create voucher successfully.", result));
        }

        [HttpPut(""), Authorize(Roles = GlobalConstant.Admin)]
        public async Task<ActionResult<ResponseMessageDetails<int>>> UpdateVoucher(Voucher voucher)
        {
            var result = await _voucherService.UpdateVoucher(voucher);

            if (result == 0)
                return BadRequest("Cannot Update voucher.");

            return Ok(new ResponseMessageDetails<int>("Update voucher successfully", result));
        }

        [HttpDelete(""), Authorize(Roles = GlobalConstant.Admin)]
        public async Task<ActionResult<ResponseMessageDetails<int>>> DeleteVoucher(int voucherId)
        {
            var result = await _voucherService.DeleteVoucher(voucherId);

            if (result == 0)
                return NotFound("Cannot delete voucher.");

            return Ok(new ResponseMessageDetails<int>("Delete voucher successfully", result));
        }

        [HttpPut("account-rank"), Authorize(Roles = GlobalConstant.User)]
        public async Task<ActionResult<ResponseMessageDetails<int>>> UpdateAccountRank()
        {
            Int32.TryParse(User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.Sid)?.Value, out int accountId);
            var result = await _voucherService.UpdateAccountRank(accountId);

            if (result == 0)
                return NotFound("Account not found.");

            return Ok(new ResponseMessageDetails<int>("Update account rank successfully", result));
        }
        
        [HttpPost("redeem"), Authorize(Roles = GlobalConstant.User)]
        public async Task<ActionResult<ResponseMessageDetails<int>>> RedeemVoucher(int voucherId)
        {
            Int32.TryParse(User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.Sid)?.Value, out int accountId);
            var result = await _voucherService.RedeemVoucher(accountId, voucherId);

            if (result == 0)
                return NotFound("Account not found.");

            return Ok(new ResponseMessageDetails<int>("Redeem voucher successfully", result));
        }
        
    }
}
