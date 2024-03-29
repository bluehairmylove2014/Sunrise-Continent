﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SunriseServer.Common.Constant;
using SunriseServer.Services.BookingService;
using SunriseServer.Common.Helper;
using System.Security.Claims;
using SunriseServerCore.Dtos;
using SunriseServerCore.Dtos.Order;
using SunriseServer.Services.PaymentService;
using AutoMapper;
using Microsoft.Data.SqlClient;

namespace SunriseServer.Controllers
{
    [Route("api/order")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        readonly IOrderService _orderService;
        readonly IPaymentService _paymentService;
        readonly IMapper _mapper;

        public OrderController(IMapper mapper, IOrderService orderService, IPaymentService paymentService)
        {
            _orderService = orderService;
            _paymentService = paymentService;
            _mapper = mapper;
        }

        [HttpGet, Authorize]
        public async Task<ActionResult<IEnumerable<GetOrderItemsDto>>> GetAccountOrder()
        {
            Int32.TryParse(User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.Sid)?.Value, out int accountId);

            var rawResult = await _orderService.GetAccountOrder(accountId);

            var result = new List<GetOrderItemsDto>();
            
            foreach (var item in rawResult)
            {
                var oneOrder = new GetOrderItemsDto();
                var oneOrderItems = rawResult.Where((r) => r.OrderId == item.OrderId);

                if (oneOrderItems is null || oneOrderItems.FirstOrDefault() is null)
                    continue;

                oneOrder = _mapper.Map<GetOrderItemsDto>(oneOrderItems.FirstOrDefault());
                var listItems = new List<OrderItemDto>();
                foreach(var orderItem in oneOrderItems)
                {
                    listItems.Add(_mapper.Map<OrderItemDto>(orderItem));
                }

                oneOrder.OrderItems = listItems;
                rawResult = rawResult.Except(oneOrderItems).ToList();
                result.Add(oneOrder);
            }

            return Ok(result);
        }

        [HttpPost, Authorize(Roles = GlobalConstant.User)]
        public async Task<ActionResult<ResponseMessageDetails<int>>> AddOrder(InputOrderDto orderDto)
        {
            var orderInfo = _mapper.Map<ListOrderDto>(orderDto);
            Int32.TryParse(User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.Sid)?.Value, out int accountId);
            
            try
            {
                var paymentDto = _paymentService.Checkout($"{orderDto.Total}");

                if (paymentDto is null)
                {
                    return BadRequest(new {
                        message = "Tài khoản không đủ số dư để thực hiện giao dịch"
                    });
                }

                orderInfo.SessionId = paymentDto.SessionId;
                var result = await _orderService.CreateOrder(orderInfo, accountId);

                if (result == 0)
                    return BadRequest(new {
                        message = "Không thể đặt phòng, vui lòng thử lại"
                    });

                return Ok(paymentDto.Url);
            }
            catch(SqlException sqlEx)
            {
                return BadRequest(new
                {
                    message = sqlEx.Message,
                });
            }
            catch (Exception)
            {
                return BadRequest(new {
                    message = "Không thể đặt phòng, vui lòng thử lại"
                });
            }
        }
    }
}
