using Microsoft.AspNetCore.Mvc;
using Stripe;
using Stripe.Checkout;
using SunriseServer.Services.BookingService;

namespace SunriseServer.Controllers
{
    [ApiController]
    [Route("api/webhook")]
    public class StripeWebHookController : Controller
    {
        const string secret = "whsec_d5a5dd966416fd9228baa57a1c6383b032acd156916ad6cc053b3ea8eb76ce0e";
        readonly IOrderService _orderService;

        public StripeWebHookController(IOrderService orderService) {
            _orderService = orderService;
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
                  secret
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
