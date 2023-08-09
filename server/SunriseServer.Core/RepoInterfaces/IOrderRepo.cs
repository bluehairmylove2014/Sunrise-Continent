using SunriseServerCore.Dtos.Booking;
using SunriseServerCore.Dtos.Order;
using SunriseServerCore.Models;

namespace SunriseServerCore.RepoInterfaces
{
    public interface IOrderRepo
    {
        Task<List<Order>> GetAccountOrderAsync(int accountId);
        Task<int> CreateOrderAsync(ListOrderDto order, int accountId);
        Task<int> ConfirmOrderAsync(int orderId, int accountId, int voucherId);        
    }
}
