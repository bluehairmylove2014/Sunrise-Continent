using SunriseServerCore.Dtos.Order;

namespace SunriseServer.Services.BookingService
{
    public interface IOrderService
    {
        Task<int> CreateOrderAsync(ListOrderDto order);
        Task<int> ConfirmOrderAsync(int accountId, int total);   
    }
};

