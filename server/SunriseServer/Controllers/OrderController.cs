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
using SunriseServerCore.Dtos.Order;

namespace SunriseServer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class orderController : ControllerBase
    {
        readonly IOrderService _orderService;

        public orderController(IOrderService orderService)
        {
            _orderService = orderService;
        }

        [HttpPost] //, Authorize(Roles = GlobalConstant.User)
        public async Task<ActionResult<ResponseMessageDetails<int>>> AddOrder(ListOrderDto orderDto)
        {
            var result = await _orderService.CreateOrderAsync(orderDto);

            if (result == 0)
                return BadRequest("Cannot add booking.");

            return Ok(new ResponseMessageDetails<int>("Add booking successfully", result));
        }
    }
}
