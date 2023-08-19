using SunriseServerCore.Dtos.Order;
using SunriseServer.Services;
using SunriseServerCore.Models;
using SunriseServerData;
namespace SunriseServer.Services.BookingService
{
    public class OrderService : IOrderService
    {
        private readonly UnitOfWork _unitOfWork;

        public OrderService(UnitOfWork uof)
        {
            _unitOfWork = uof;
        }

        public async Task<IEnumerable<Order>> GetAccountOrder(int accountId)
        {
            var result = await _unitOfWork.OrderRepo.GetAccountOrderAsync(accountId);
            return result;
        }

        public async Task<int> CreateOrder(ListOrderDto order, int accountId)
        {
            var result = await _unitOfWork.OrderRepo.CreateOrderAsync(order, accountId);
            await _unitOfWork.SaveChangesAsync();
            return result;
        }

        public async Task<int> ConfirmOrder(string sessionId)
        {
            var result = await _unitOfWork.OrderRepo.ConfirmOrderAsync(sessionId);
            return result;
        }
    }
}
