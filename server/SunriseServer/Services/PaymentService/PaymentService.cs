﻿using Stripe.Checkout;
using Stripe;
using SunriseServerCore.Dtos;
using SunriseServerCore.Models;
using Microsoft.Extensions.Options;
using SunriseServerCore.Dtos.Payment;

namespace SunriseServer.Services.PaymentService
{
    public class PaymentService : IPaymentService
    {
        readonly StripeSettings _stripeSettings;
        // call api to confirm order (update paid column in Account_Order table)
        public const string SUCCESS_URL = "http://www.sunrise-continent.online/success-order";
        const string FAIL_URL = "http://www.sunrise-continent.online";
        const string CURRENCY = "vnd";
        public string SessionId { get; set; }
        public PaymentService(IOptions<StripeSettings> stripeSettings) {
            _stripeSettings = stripeSettings.Value;
        }

        public PaymentDto Checkout(string totalPay)
        {
            var currency = CURRENCY;
            var successUrl = SUCCESS_URL;
            var cancelUrl = FAIL_URL;

            StripeConfiguration.ApiKey = _stripeSettings.SecretKey;

            try
            {
                var options = new SessionCreateOptions
                {
                    PaymentMethodTypes = new List<string>
                {
                    "card"
                },
                    LineItems = new List<SessionLineItemOptions>
                {
                    new SessionLineItemOptions
                    {
                        PriceData = new SessionLineItemPriceDataOptions
                        {
                            Currency = currency,
                            UnitAmount = Convert.ToInt64(totalPay),
                            ProductData = new SessionLineItemPriceDataProductDataOptions
                            {
                                Name = "Thanh toán đặt phòng",
                                Description = "Thanh toán với thẻ thanh toán quốc tế VISA",
                                Images = new List<string>
                                {
                                    "https://rialloer.sirv.com/Sunrise-Continent/Logo/sc-vertical.png?fbclid=IwAR0f1zZWcQItrZZ4DKM566XS5f0e3XXxtzS8ofBZGh-OayprXK1CJhRuJjs",
                                    "https://leadtravel.com.vn/cam-nang-du-lich/wp-content/uploads/2018/06/khach-san-5-sao-ha-long-1.jpg",
                                    "https://2trip.vn/wp-content/uploads/2021/04/khach-san-5-sao-tai-vung-tau-1.jpg"
                                }
                            }
                        },
                        Quantity = 1
                    }
                },
                    Mode = "payment",
                    SuccessUrl = successUrl,
                    CancelUrl = cancelUrl
                };

                var result = new PaymentDto();
                var service = new SessionService();
                var session = service.Create(options);
                result.Url = session.Url;
                result.SessionId = session.Id;

                // url to stripe payment page
                return result;
            }
            catch
            {
                return default;
            }
        }
    }
}
