using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Stripe;
using Stripe.Checkout;
using SunriseServer.Common.Constant;
using SunriseServer.Common.Helper;
using SunriseServer.Services.BookingService;
using SunriseServer.Services.PaymentService;
using SunriseServerCore.Dtos;
using SunriseServerCore.Dtos.Order;

namespace SunriseServer.Controllers
{
    [Route("api/payment")]
    [ApiController]
    public class PaymentController : ControllerBase
    {
        readonly StripeSettings _stripeSettings;
        readonly IOrderService _orderService;
        readonly IPaymentService _paymentService;

        public string SessionId { get; set; }

        public PaymentController(IOptions<StripeSettings> stripeSettings, IOrderService orderService, IPaymentService paymentService)
        {
            _stripeSettings = stripeSettings.Value;
            _orderService = orderService;
            _paymentService = paymentService;
        }

        [HttpPost, Authorize(Roles = GlobalConstant.User)]
        public ActionResult<string> CreateCheckoutSession(InputOrderDto orderDto)
        {
            try
            {
                return Ok(_paymentService.Checkout($"{orderDto.Total}"));
            } catch (Exception)
            {
                return BadRequest("An error has occured while attempting to checkout");
            }
        } 
    }
}
