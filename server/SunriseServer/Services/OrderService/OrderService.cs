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

        public async Task<int> CreateOrderAsync(ListOrderDto order)
        {
            var result = await _unitOfWork.OrderRepo.CreateOrderAsync(order);
            await _unitOfWork.SaveChangesAsync();
            return result;
        }

        public async Task<int> ConfirmOrderAsync(int accountId, int total)
        {
            var result = await _unitOfWork.OrderRepo.ConfirmOrderAsync(accountId, total);
            return result;
        }
    }
}
