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
    public class bookingController : ControllerBase
    {
        readonly IBookingService _bookingService;
        readonly IAccountService _accountService;
        readonly IPaymentService _hotelService;
        readonly IVoucherService _voucherService;
        readonly IRoomService _roomService;

        public bookingController(
            IBookingService bookingService, 
            IAccountService accountService, 
            IPaymentService hotelService,
            IVoucherService voucherService,
            IRoomService roomService)
        {
            _bookingService = bookingService;
            _accountService = accountService;
            _hotelService = hotelService;
            _voucherService = voucherService;
            _roomService = roomService;
        }

        [HttpGet("get-bookings-current-account"), Authorize(Roles = GlobalConstant.User)]
        public async Task<ActionResult<ResponseMessageDetails<List<BookingDto>>>> GetAllUserBookings()
        {
            Account currentAcc = await _accountService.GetByUsername(User.Identity.Name);
            var result = await _bookingService.GetAllBookings(currentAcc.Id);
            var finalResult = new List<BookingDto>();
            foreach (var item in result)
            {
                var account = await _accountService.GetById(item.AccountId);
                var hotel = await _hotelService.GetSingleHotel(item.HotelId);
                var room = await _roomService.GetSingleRoom(item.HotelId, item.RoomTypeId);
                var voucher = await _voucherService.GetVoucherById(item.VoucherId);

                BookingDto variable = new BookingDto { };

                SetPropValueByReflection.AddYToX(variable, item);

                variable.Account = account;
                variable.Hotel = hotel;
                variable.RoomType = room;
                variable.Voucher = voucher;

                finalResult.Add(variable);
            }

            return Ok(new ResponseMessageDetails<List<BookingDto>>("Get bookings successfully", finalResult));
        }

        [HttpPost, Authorize(Roles = GlobalConstant.User)]
        public async Task<ActionResult<ResponseMessageDetails<List<BookingAccount>>>> AddBooking(AddBookingDto bookingDto)
        {
            var result = await _bookingService.AddBooking(bookingDto);

            if (result == null)
                return BadRequest("Cannot add booking.");

            return Ok(new ResponseMessageDetails<BookingAccount>("Add booking successfully", result));
        }

        [HttpPut("confirm"), Authorize(Roles = GlobalConstant.User)] //
        public async Task<ActionResult<ResponseMessageDetails<int>>> ConfirmBooking(int accountId, int totalPay)
        {
            var result = await _bookingService.ConfirmBooking(accountId, totalPay);
            if (result == 0)
                return BadRequest("Confirm booking failed.");

            return Ok(new ResponseMessageDetails<int>("Confirm booking successfully", ResponseStatusCode.Ok));
        }

        [HttpPut, Authorize(Roles = GlobalConstant.User)]
        public async Task<ActionResult<ResponseMessageDetails<BookingAccount>>> UpdateBooking(BookingAccount request)
        {
            var result = await _bookingService.UpdateBooking(request);
            if (result == 0)
                return NotFound("Booking not found.");

            return Ok(new ResponseMessageDetails<BookingAccount>("Update booking successfully", ResponseStatusCode.Ok));
        }

        [HttpDelete, Authorize(Roles = GlobalConstant.User)]
        public async Task<ActionResult<ResponseMessageDetails<BookingAccount>>> DeleteBooking(DeleteBookingDto deleteDto)
        {
            Account currentAcc = await _accountService.GetByUsername(User.Identity.Name);
            deleteDto.AccountId = currentAcc.Id;

            var result = await _bookingService.DeleteBooking(deleteDto);
            if (result == 0)
                return NotFound("Booking not found.");

            return Ok(new ResponseMessageDetails<int>("Delete booking successfully", ResponseStatusCode.Ok));
        }
    }
}
