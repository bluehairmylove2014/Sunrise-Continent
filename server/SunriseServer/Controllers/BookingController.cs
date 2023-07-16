using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SunriseServer.Common.Constant;
using SunriseServer.Common.Enum;
using SunriseServerCore.Models;
using SunriseServer.Services.BookingService;
using CoreApiResponse;
using SunriseServer.Dtos;
using SunriseServerCore.Common.Enum;

namespace SunriseServer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BookingController : ControllerBase
    {
        readonly IBookingService _bookingService;

        public BookingController(IBookingService bookingService)
        {
            _bookingService = bookingService;
        }

        [HttpGet]
        public async Task<ActionResult<ResponseMessageDetails<List<BookingAccount>>>> GetAllBookings()
        {
            return Ok(new ResponseMessageDetails<List<BookingAccount>>("Get bookings successfully.", await _bookingService.GetAllBookings()));
        }

        [HttpPost, Authorize(Roles = GlobalConstant.User)]
        public async Task<ActionResult<ResponseMessageDetails<List<BookingAccount>>>> AddBooking(BookingAccount booking)
        {
            var result = await _bookingService.AddBooking(booking);

            if (result == null)
                return BadRequest("Cannot add booking.");

            return Ok(new ResponseMessageDetails<BookingAccount>("Add booking successfully", result));
        }

        [HttpPut("{id}"), Authorize(Roles = GlobalConstant.User)]
        public async Task<ActionResult<ResponseMessageDetails<BookingAccount>>> UpdateBooking(int id, BookingAccount request)
        {
            var result = await _bookingService.UpdateBooking(id, request);
            if (result is null)
                return NotFound("Booking not found.");

            return Ok(new ResponseMessageDetails<BookingAccount>("Update booking successfully", result));
        }

        [HttpDelete("{id}"), Authorize(Roles = GlobalConstant.User)]
        public async Task<ActionResult<ResponseMessageDetails<BookingAccount>>> DeleteBooking(int id)
        {
            var result = await _bookingService.DeleteBooking(id);
            if (result is null)
                return NotFound("Booking not found.");

            return Ok(new ResponseMessageDetails<BookingAccount>("Delete booking successfully", result));
        }
    }
}
