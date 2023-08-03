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
            // var builder = new StringBuilder("EXEC dbo.USP_AddBookingToOrderAndConfirmBookingCombined ");
            // var str = SetPropValueByReflection.GetPropProcCallString(order);
            // builder.Append(str);

            // Console.WriteLine(str);
            // EXECUTE({builder.ToString()})
            var result = await _dataContext.Order.FromSqlInterpolated($"Print 1").ToListAsync();
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

            var hotelList = order.orders
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
            return 0;
        }

        public async Task<int> ConfirmOrderAsync(int accountId, int total)
        {
            // builder.Append($"SELECT @Total = dbo.USF_GetOrderTotal(@OrderId);\n");
            // builder.Append($"EXEC USP_ConfirmOrder @OrderId, {order.AccountId}, {order.VoucherId}, @Total;\n");
                
             

            string str = $"EXEC USP_ConfirmBooking @AccountId={accountId}, @Total={total};";
            return await _dataContext.Database.ExecuteSqlInterpolatedAsync($"EXECUTE({str})");
        }
    }
}
