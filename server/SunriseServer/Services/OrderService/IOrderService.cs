using SunriseServerCore.Dtos.Order;

namespace SunriseServer.Services.BookingService
{
    public interface IOrderService
    {
        Task<int> CreateOrder(ListOrderDto order, int accountId);
        Task<int> ConfirmOrder(int orderId, int accountId, int voucherId);
        Task<List<Order>> GetAccountOrder(int accountId);
    }
};

