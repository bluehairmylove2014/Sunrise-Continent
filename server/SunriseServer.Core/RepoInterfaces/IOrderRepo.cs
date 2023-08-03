using SunriseServerCore.Dtos.Booking;
using SunriseServerCore.Dtos.Order;
using SunriseServerCore.Models;

namespace SunriseServerCore.RepoInterfaces
{
    public interface IOrderRepo
    {
        Task<int> CreateOrderAsync(ListOrderDto order);
        Task<int> ConfirmOrderAsync(int accountId, int total);        
    }
}
