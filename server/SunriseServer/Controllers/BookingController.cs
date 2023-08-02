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
        readonly IHotelService _hotelService;
        readonly IVoucherService _voucherService;
        readonly IRoomService _roomService;

        public bookingController(
            IBookingService bookingService, 
            IAccountService accountService, 
            IHotelService hotelService,
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

                BookingDto variable = new BookingDto { };

                SetPropValueByReflection.AddYToX(variable, item);

                variable.Account = account;
                variable.Hotel = hotel;
                variable.RoomType = room;

                finalResult.Add(variable);
            }

            return Ok(new ResponseMessageDetails<List<BookingDto>>("Get bookings successfully", finalResult));
        }

        [HttpPost] //, Authorize(Roles = GlobalConstant.User)
        public async Task<ActionResult<ResponseMessageDetails<int>>> AddBooking(AddBookingDto bookingDto)
        {
            var result = await _bookingService.AddBooking(bookingDto);

            if (result == 0)
                return BadRequest("Cannot add booking.");

            return Ok(new ResponseMessageDetails<int>("Add booking successfully", result));
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
        public async Task<ActionResult<ResponseMessageDetails<BookingAccount>>> DeleteBooking(int BookingId)
        {
            var result = await _bookingService.DeleteBooking(BookingId);
            if (result == 0)
                return NotFound("Booking not found.");

            return Ok(new ResponseMessageDetails<int>("Delete booking successfully", ResponseStatusCode.Ok));
        }
    }
}
