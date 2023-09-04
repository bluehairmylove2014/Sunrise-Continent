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
using SunriseServerCore.Dtos.Voucher;

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

        [HttpGet(""), Authorize(Roles = GlobalConstant.Admin)]
        public async Task<ActionResult<List<Voucher>>> GetAllVoucher()
        {
            var result = await _voucherService.GetAllVoucher(); // thêm số lượng cho voucher

            if (result == null)
                return BadRequest(new
                {
                    message = "Không thể lấy danh sách mã khuyến mãi"
                });

            return Ok(result.ToList());
        }

        #nullable enable
        [HttpGet("bag"), Authorize(Roles = GlobalConstant.User)]
        public async Task<ActionResult<List<VoucherDto>>> GetVoucherBag(string? rank)
        {
            Int32.TryParse(User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.Sid)?.Value, out int accountId);
            var result = await _voucherService.GetAccountVoucher(accountId, rank);

            if (result == null)
                return BadRequest(new {
                    message = "Không thể lấy danh sách mã khuyến mãi của tài khoản"
                });

            return Ok(result);
        }
        #nullable disable


        [HttpPost(""), Authorize(Roles = GlobalConstant.Admin)]
        public async Task<ActionResult<ResponseMessageDetails<int>>> AddVoucher(AddVoucherDto voucherDto)
        {
            if (voucherDto.Value > 1)
                return BadRequest(new {
                    message = "Wrong voucher value."
                });
            
            int result;
            try
            {
                result = await _voucherService.CreateVoucher(voucherDto);
            }
            catch (Microsoft.Data.SqlClient.SqlException exception)
            {
                return BadRequest(exception.Message);
            }

            if (result == -1)
                return BadRequest(new {
                    message = "Không thể tạo mã khuyến mãi, vui lòng thử lại sau"
                });

            return Ok(new ResponseMessageDetails<int>("Tạo mã khuyến mãi thành công", result));
        }

        [HttpPut(""), Authorize(Roles = GlobalConstant.Admin)]
        public async Task<ActionResult<ResponseMessageDetails<int>>> UpdateVoucher(Voucher voucher)
        {
            if (voucher.Value > 1 || voucher.Value < 0)
                return BadRequest(new {
                    message = "Sai dữ liệu mã khuyến mãi"
                });

            int result;
            try
            {
                result = await _voucherService.UpdateVoucher(voucher);
            }
            catch (Microsoft.Data.SqlClient.SqlException exception)
            {
                return BadRequest(exception.Message);
            }

            return Ok(new ResponseMessageDetails<int>("Cập nhật mã khuyến mãi thành công", result));
        }

        [HttpDelete(""), Authorize(Roles = GlobalConstant.Admin)]
        public async Task<ActionResult<ResponseMessageDetails<int>>> DeleteVoucher(int voucherId)
        {
            var result = await _voucherService.DeleteVoucher(voucherId);

            if (result == 0)
                return NotFound(new {
                    message = "Không thể xóa mã khuyến mãi"
                });

            return Ok(new ResponseMessageDetails<int>("Xóa mã khuyến mãi thành công", result));
        }

        [HttpPut("account-rank"), Authorize(Roles = GlobalConstant.User)]
        public async Task<ActionResult<ResponseMessageDetails<int>>> UpdateAccountRank()
        {
            Int32.TryParse(User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.Sid)?.Value, out int accountId);
            var result = await _voucherService.UpdateAccountRank(accountId);

            if (result == 0)
                return NotFound(new {
                    message = "Không tìm thấy tài khoản"
                });

            return Ok(new ResponseMessageDetails<int>("Cập nhật hạng thành viên thành công", result));
        }
        
        [HttpPost("redeem"), Authorize(Roles = GlobalConstant.User)]
        public async Task<ActionResult<ResponseMessageDetails<int>>> RedeemVoucher(RedeemVoucherDto voucherDto)
        {
            if (voucherDto.Quantity <= 0) 
                return BadRequest(new {
                    message = "Số lượng voucher không hợp lệ."
                });
            
            Int32.TryParse(User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.Sid)?.Value, out int accountId);

            int result = 0;
            try
            {
                result = await _voucherService.RedeemVoucher(accountId, voucherDto.VoucherId, voucherDto.Quantity);
            }
            catch (Microsoft.Data.SqlClient.SqlException exception)
            {
                return BadRequest(new {
                    message = exception.Message
                });
            }
            catch (Exception)
            {
                return BadRequest(new
                {
                    message = "Đã xảy ra lỗi trong quá trình đổi mã khuyến mãi, vui lòng thử lại sau"
                });
            }

            return Ok(new ResponseMessageDetails<int>("Đổi mã khuyến mãi thành công", result));
        }
        
    }
}
