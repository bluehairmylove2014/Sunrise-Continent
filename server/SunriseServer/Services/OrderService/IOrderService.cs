using SunriseServerCore.Dtos.Order;

namespace SunriseServer.Services.BookingService
{
    public interface IOrderService
    {
        Task<int> CreateOrder(ListOrderDto order, int accountId);
        Task<int> ConfirmOrder(string sessionId);
        Task<IEnumerable<Order>> GetAccountOrder(int accountId);
    }
};

