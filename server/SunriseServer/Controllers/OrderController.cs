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
    [Route("api/order")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        readonly IOrderService _orderService;

        public OrderController(IOrderService orderService)
        {
            _orderService = orderService;
        }

        [HttpGet, Authorize(Roles = GlobalConstant.User)] //, Authorize(Roles = GlobalConstant.User)
        public async Task<ActionResult<List<Order>>> GetAccountOrder()
        {
            var result = await _orderService.GetAccountOrder(User.Identity.Name);

            if (result is null)
                return NotFound("Cannot add booking.");

            return Ok(result);
        }

        [HttpPost, Authorize(Roles = GlobalConstant.User)] //, Authorize(Roles = GlobalConstant.User)
        public async Task<ActionResult<ResponseMessageDetails<int>>> AddOrder(InputOrderDto orderDto)
        {
            var orderInfo = new ListOrderDto();
            SetPropValueByReflection.AddYToX(orderInfo, orderDto);
            var result = await _orderService.CreateOrder(orderInfo, User.Identity.Name);

            if (result == 0)
                return BadRequest("Cannot add booking.");

            return Ok(new ResponseMessageDetails<int>("Add booking successfully", result));
        }

        // [HttpPut("confirm"), Authorize(Roles = GlobalConstant.User)] //, Authorize(Roles = GlobalConstant.User)
        // public async Task<ActionResult<ResponseMessageDetails<int>>> ConfirmOrder(int orderId, int accountId, int voucherId)
        // {
        //     var result = await _orderService.ConfirmOrder(orderId, accountId, voucherId);

        //     if (result == 0)
        //         return BadRequest("Cannot order booking.");

        //     return Ok(new ResponseMessageDetails<int>("Confirm order successfully", result));
        // }
    }
}
