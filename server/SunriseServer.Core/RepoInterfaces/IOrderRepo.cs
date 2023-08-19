using SunriseServerCore.Dtos.Booking;
using SunriseServerCore.Dtos.Order;
using SunriseServerCore.Models;

namespace SunriseServerCore.RepoInterfaces
{
    public interface IOrderRepo
    {
        Task<IEnumerable<Order>> GetAccountOrderAsync(int accountId);
        Task<int> CreateOrderAsync(ListOrderDto order, int accountId);
        Task<int> ConfirmOrderAsync(string sessionId);        
    }
}
