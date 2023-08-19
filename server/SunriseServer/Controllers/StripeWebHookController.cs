using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Stripe;
using Stripe.Checkout;
using SunriseServer.Services.BookingService;

namespace SunriseServer.Controllers
{
    [ApiController]
    [Route("api/webhook")]
    public class StripeWebHookController : Controller
    {
        readonly IOrderService _orderService;
        readonly StripeSettings _stripeSettings;

        public StripeWebHookController(IOptions<StripeSettings> stripeSettings, IOrderService orderService) {
            _orderService = orderService;
            _stripeSettings = stripeSettings.Value;
        }

        // stripe uses this api to confirm order (cannot access outside stripe)
        [HttpPost]
        public async Task<IActionResult> Index()
        {
            var json = await new StreamReader(HttpContext.Request.Body).ReadToEndAsync();

            Console.WriteLine(json);

            try
            {
                if (Request.Headers.Count() == 0)
                    return BadRequest();

                var stripeEvent = EventUtility.ConstructEvent(
                  json,
                  Request.Headers["Stripe-Signature"],
                  _stripeSettings.WebHookKey
                );

                // update order
                if (stripeEvent.Type == Events.CheckoutSessionCompleted)
                {
                    var session = stripeEvent.Data.Object as Stripe.Checkout.Session;
                    await _orderService.ConfirmOrder(session.Id);
                }

                return Ok();
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }
    }
}
