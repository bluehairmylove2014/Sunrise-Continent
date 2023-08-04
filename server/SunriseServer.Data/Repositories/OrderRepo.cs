using Microsoft.Identity.Client;
using SunriseServerCore.Dtos.Booking;
using SunriseServerCore.Dtos.Order;
using SunriseServerCore.Models;
using SunriseServerCore.RepoInterfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SunriseServer.Common.Helper;

namespace SunriseServerData.Repositories
{
    public class OrderRepo : IOrderRepo
    {
        readonly DataContext _dataContext;

        // RepositoryBase<BookingAccount>,  : base (dataContext)
        public OrderRepo(DataContext dataContext) {
            _dataContext = dataContext;
        }

        public async Task<List<Order>> GetAccountOrderAsync(int accountId)
        {
            var result = await _dataContext.Order.FromSqlInterpolated($"EXEC USP_GetAllAccountOrder @AccountId={accountId};").ToListAsync();
            return result;
        }

        public async Task<int> CreateOrderAsync(ListOrderDto order)
        {
            var builder = new StringBuilder("DECLARE @BookingId INT, @OrderId INT, @Total INT;\n");

            var str = SetPropValueByReflection.GetPropProcCallString(order);
            str = str.Replace("@FullName=", "@FullName=N");
            str = str.Replace("@Nation=", "@Nation=N");
            str = str.Replace("@SpecialNeeds=", "@SpecialNeeds=N");
            str = str.Replace("@Notes=", "@Notes=N");
            int start = str.LastIndexOf(", @VoucherId"), count = str.Length - start;

            var hotelList = order.Orders
                            .GroupBy(o => o.HotelId)
                            .Select(x => x.Select(v => v).ToList())
                            .ToList();

            foreach (var item in hotelList)
            {
                builder.Append($"EXEC @OrderId = USP_AddFullOrder {str.Remove(start, count)};\n");
                
                foreach (var hotel in item)
                {
                    var booking = SetPropValueByReflection.GetPropProcCallString(hotel);
                    builder.Append($"EXEC @BookingId = USP_AddBooking @AccountId={order.AccountId}, {booking}");
                    builder.Append($"EXEC USP_AddBookingByOrderId @OrderId, @BookingId;\n");
                }

            }

            // await Task.Delay(100);
            // Console.WriteLine(builder.ToString());
            
            var result = await _dataContext.Database.ExecuteSqlInterpolatedAsync($"EXECUTE({builder.ToString()})");
            return result;
        }

        public async Task<int> ConfirmOrderAsync(int orderId, int accountId, int voucherId)
        {
            return await _dataContext.Database
                .ExecuteSqlInterpolatedAsync($"EXEC USP_ConfirmOrder @OrderId={orderId}, @AccountId={accountId}, @VoucherId={voucherId};");
        }
    }
}
