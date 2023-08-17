using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SunriseServer.Common.Constant;
using SunriseServer.Services.BookingService;
using SunriseServer.Common.Helper;
using System.Security.Claims;
using SunriseServerCore.Dtos;
using SunriseServerCore.Dtos.Order;
using SunriseServer.Services.PaymentService;

namespace SunriseServer.Controllers
{
    [Route("api/order")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        readonly IOrderService _orderService;
        readonly IPaymentService _paymentService;

        public OrderController(IOrderService orderService, IPaymentService paymentService)
        {
            _orderService = orderService;
            _paymentService = paymentService;
        }

        [HttpGet, Authorize(Roles = GlobalConstant.User)]
        public async Task<ActionResult<List<Order>>> GetAccountOrder()
        {
            Int32.TryParse(User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.Sid)?.Value, out int accountId);

            var result = await _orderService.GetAccountOrder(accountId);

            if (result is null)
                return NotFound("Cannot add booking.");

            return Ok(result);
        }

        [HttpPost, Authorize(Roles = GlobalConstant.User)]
        public async Task<ActionResult<ResponseMessageDetails<int>>> AddOrder(InputOrderDto orderDto)
        {
            var orderInfo = new ListOrderDto();
            SetPropValueByReflection.AddYToX(orderInfo, orderDto);

            Int32.TryParse(User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.Sid)?.Value, out int accountId);
            var result = await _orderService.CreateOrder(orderInfo, accountId);

            if (result == 0)
                return BadRequest("Cannot add booking.");

            try
            {
                var checkoutUrl = _paymentService.Checkout($"{orderDto.Total}");

                if (string.IsNullOrEmpty(checkoutUrl))
                {
                    return BadRequest("Not enough money to pay your order");
                }

                return Ok(checkoutUrl);

            }
            catch (Exception)
            {
                return BadRequest("An error occurs when checkout");
            }
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
