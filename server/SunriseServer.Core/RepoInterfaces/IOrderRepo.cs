using SunriseServerCore.Dtos.Booking;
using SunriseServerCore.Dtos.Order;
using SunriseServerCore.Models;

namespace SunriseServerCore.RepoInterfaces
{
    public interface IOrderRepo
    {
        Task<List<Order>> GetAccountOrderAsync(string email);
        Task<int> CreateOrderAsync(ListOrderDto order, string email);
        Task<int> ConfirmOrderAsync(int orderId, int accountId, int voucherId);        
    }
}
